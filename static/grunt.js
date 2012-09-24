module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({
        compass: {
            dev: {
                src: 'sass',
                dest: 'css',
                linecomments: true,
                forcecompile: true,
                require: '',
                debugsass: true,
                images: 'images',
                relativeassets: true
            },
            prod: {
                src: 'sass',
                dest: 'css',
                outputstyle: 'compressed',
                linecomments: false,
                forcecompile: true,
                require: '',
                debugsass: false,
                images: 'images',
                relativeassets: true
            }
        },
        coffee : {
            dest : 'js',
            src  : 'coffee'
        },
        vendor : {
            src  : 'vendor',
            dest : 'js/vendor'
        },
        optimise : {
            config : 'build.conf.js'
        },
        test : {
            coffee: {
                dest : 'tests/specs',
                src  : 'tests/specs'
            },
            cleanup : {
                files : 'tests/specs/**/*.js'
            }
        },
        preCleanup : {
            folders : ['js', 'css']
        },
        postCleanup : {
            folders : ['-p']
        },
        watch : {
            coffee : {
                files : ['coffee/*.coffee', 'coffee/**/*.coffee'],
                tasks : 'dev'
            }
        }
    });

    grunt.loadNpmTasks('grunt-compass');

    grunt.registerTask('dev', 'preCleanup compass coffee vendor postCleanup');
    grunt.registerTask('prod', 'preCleanup compass:prod coffee vendor optimise:prod postCleanup');
    grunt.registerTask('cleanup', 'preCleanup postCleanup');

    grunt.registerTask('default', 'dev');

    var exec = function(cmd, done) {
        require('child_process').exec(cmd, function (error, stdout, stderr) {
            if (stderr) {
                console.log(stderr);
            }
            if (stdout) {
                console.log(stdout);
            }
            done(error === null);
        });
    };

    var coffee = function(src, dest, done) {
        exec('coffee -o ' + dest + ' -c ' + src, done);
    };


    var rmdir = function(path) {
        fs.rmdirSync(path);
    };

    var unlink = function(path) {
        fs.unlinkSync(path);
    };

    var unlinkR = function(path) {
        var innerFiles = grunt.file.expandFiles(path + '/**/*');
        for (var i = 0; i < innerFiles.length; i++) {
            try {
                unlink(innerFiles[i]);
            } catch(err) {}
        }
    };

    var rmdirR = function(dir) {
        var innerDirs = grunt.file.expandDirs(dir + '/**/*').reverse();
        for (var i = 0; i < innerDirs.length; i++) {
            try {
                rmdir(innerDirs[i]);
            } catch(err) {}
        }
    };

    var cleanup = function(folders, files) {
        for (var i = 0; i < folders.length; i++ ) {
            unlinkR(folders[i]);
            rmdirR(folders[i]);
            try {
                rmdir(folders[i]);
            } catch(err) {}
        }

        for (var j = 0; j < files.length; j++) {
            try {
                unlink(files[j]);
            } catch(err) {}
        }
    };

    grunt.registerTask('coffee', 'Compile CoffeeScript files', function () {
        coffee(grunt.config.get(this.name).src, grunt.config.get(this.name).dest, this.async());
    });

    grunt.registerTask('vendor', 'Copy vendor libraries', function () {
        var files = grunt.file.expandFiles(grunt.config.get(this.name).src + '/**/*.js');
        for (var i = 0; i < files.length; i++) {
            grunt.file.copy(files[i], grunt.config.get(this.name).dest + '/' + files[i].replace(grunt.config.get(this.name).src + '/', ''));
        }
    });

    grunt.registerTask('preCleanup', 'Remove dynamically generated folders|files', function () {
        cleanup(grunt.config.get(this.name).folders || [], grunt.config.get(this.name).files || []);
    });

    grunt.registerTask('postCleanup', 'Remove dynamically generated folders|files', function () {
        cleanup(grunt.config.get(this.name).folders || [], grunt.config.get(this.name).files || []);
    });

    grunt.registerTask('optimise', 'Combine modules together into build layers', function () {
        var cmd = "r.js" + (isWin ? '.cmd' : '') + " -o " + grunt.config.get(this.name).config;
        exec(this.flags.prod ? cmd += " optimize=uglify" : cmd, this.async());
    });

    grunt.registerMultiTask('test', 'Run jasmine tests', function() {
        var done = this.async();
        if (this.target === 'coffee') {
            coffee(this.data.src, this.data.dest, done);
        }
        if (this.target === 'process') {
            server(this.data.nodeStatic, this.data.port, this.data.base);
            if (isWin) {
                this.data.phantomjs = this.data.phantomjs.replace(/\//g, '\\\\');
            }
            exec(this.data.phantomjs + ' ' + this.data.runner + ' ' + this.data.url, done);
        }
        if (this.target === 'cleanup') {
            cleanup([], grunt.file.expandFiles(this.data.files));
            done();
        }
    });

};
