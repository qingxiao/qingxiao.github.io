module.exports = function (grunt) {
    // 项目配置
    grunt.initConfig({
        pkg: grunt.file.readJSON('cfg.json'),
        uglify: {
            options: {
                banner: '/*! create by <%= pkg.author %> <%= grunt.template.today("yyyy-mm-dd hh:MM:ss") %> */\n'
            },
            "my_target": {
                "files": [{
                    expand: true,
                    cwd:"src",
                    src: '**/*.js',
                    dest:"dest"
                }]
            },
            buildb:{//任务二：压缩b.js，输出压缩信息
                options: {
                    report: "min"//输出压缩率，可选的值有 false(不输出信息)，gzip
                },
                files: {
                    'dest/all.min.js': "dest/**/*.js"
                }
            }
        }
    });
    // 加载提供"uglify"任务的插件
    grunt.loadNpmTasks('grunt-contrib-uglify');
    // 默认任务
    grunt.registerTask('default', ['uglify']);
}