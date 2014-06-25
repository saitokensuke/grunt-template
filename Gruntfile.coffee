module.exports = (grunt) ->
  grunt.initConfig
    pkg_name: "html-template"
    dist_dir: ""
    src_dir: "src/"

    htmlmin:
      options:
        removeComments: true
        collapseWhitespace: true

      files:
        "<%= dist_dir %>index.html" : "<%= src_dir %>index.html"

    compass:
      normal:
        options:
          specify: "<%= src_dir %>sass/style.scss"
          sassDir: "<%= src_dir %>sass"
          cssDir: "css"
          imageDir: "<%= src_dir %>img"
          generatedImagesDir: "<%= src_dir %>img"
          httpGeneratedImagesPath: "img"
          outputStyle: "compact"
          noLineComments: true

    uglify:
      files:
        src: "<%= src_dir %>js/application.js"
        dest: "js/script.min.js"

    haml:
      normal:
        files:
            "<%= src_dir %>index.html": "<%= src_dir %>haml/index.haml"

    watch:
      options:
        livereload: true

      # html_files:
      #   files: "<%= src_dir %>*.html"
      #   tasks: "htmlmin"

      css_files:
        files: "<%= src_dir %>sass/*.scss"
        tasks: "compass"

      js_files:
        files: "<%= src_dir %>js/*.js"
        tasks: "uglify"

      haml_files:
        files: "<%= src_dir %>haml/*.haml"
        tasks: "haml"

    connect:
      site:
        options:
          hostname: "*"
          port: 8000

    autoprefixer:
      options:
        browsers: [
          "last 2 version"
          "ie 8"
          "ie 9"
        ]

    image:
      static:
        files:
          "dist/img.png": "src/img.png"
          "dist/img.jpg": "src/img.jpg"
          "dist/img.gif": "src/img.gif"
          "dist/img.svg": "src/img.svg"
      dynamic:
        files: [
          expand: true
          cwd: "<%= src_dir %>"
          src: ["**/*.{png,jpg,gif,svg}"]
          dest: "<%= dist_dir %>"
        ]

  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-htmlmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-image"
  grunt.loadNpmTasks "grunt-contrib-haml"

  grunt.registerTask "build", [
    "htmlmin"
    "compass"
    "uglify"
  ]

  grunt.registerTask "build-image", ["image:dynamic"]

  grunt.registerTask "default", [
    "connect"
    "watch"
  ]