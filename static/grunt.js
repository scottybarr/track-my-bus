module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({
        compass: {
            src: 'sass',
            dest: 'css',
        },
        min : {
            src: ['js/*.js', 'js/*/*.js'],
            dest: 'js/main.js'
        },
        coffee : {
            dest : 'js',
            src  : 'coffee'
        },
        vendor : {
            src  : 'vendor',
            dest : 'js/vendor'
        },
        watch : {
            coffee : {
                files : ['coffee/*.coffee', 'coffee/**/*.coffee'],
                tasks : 'dev'
            },
            compass : {
                files : ['sass/*.scss', 'sass/*/*.scss'],
                tasks : 'compass'
            }
        }
    });

    grunt.registerTask('dev', 'compass coffee vendor');
    grunt.registerTask('prod', 'compass coffee vendor min');

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

    var compass = function(src, dest, done) {
        exec('compass compile', done);
    };

    grunt.registerTask('compass', 'Compile SASS files', function () {
        compass(grunt.config.get(this.name).src, grunt.config.get(this.name).dest, this.async());
    });

    grunt.registerTask('coffee', 'Compile CoffeeScript files', function () {
        coffee(grunt.config.get(this.name).src, grunt.config.get(this.name).dest, this.async());
    });

    grunt.registerTask('vendor', 'Copy vendor libraries', function () {
        var files = grunt.file.expandFiles(grunt.config.get(this.name).src + '/**/*.js');
        for (var i = 0; i < files.length; i++) {
            grunt.file.copy(files[i], grunt.config.get(this.name).dest + '/' + files[i].replace(grunt.config.get(this.name).src + '/', ''));
        }
    });

};