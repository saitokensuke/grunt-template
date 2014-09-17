# 使い方

##リポジトリをクローン

ディレクトリに移動して

```
$ npm install
```

`package.json`をもとに`node_modules`がインストールされる

# フォルダ構成

```
[html-template]
 ├[css]
 │ └style.css
 ├[img]
 ├[js]
 │ ├[libs]
 │ └script.min.js
 ├[node_modules]
 ├Gruntfile.coffee
 ├package.json
 └[src] #下記を参照

-[src]
 ├index.html
 ├[img]
 │ ├[sprite]
 │ └sprite-hogehoge.png
 ├[js]
 │ └application.js
 └[sass]
   └style.scss
```

# Grunt関連

## パッケージ

`package.json`に記載

## タスク

`Gruntfile.coffee`に記載

### grunt

`connect`
`watch`
が実行される

`connect`でサーバーが立ち上がる

`watch`で
`compass`
`uglify`
`htmlmin`
が実行される

### grunt build

`htmlmin`
`compass`
`uglify`
`autoprefixer`
が実行される

### grunt build-image

`image`
が実行される

## フロー

#### htmlmin

```
/src/index.html
↓htmlmin
/index.html
```

#### css

```
/src/sass/style.scss
↓compass
/css/style.css
```

#### js

```
/src/js/application.js
↓uglify
/js/script.min.js
```

#### 画像

```
/src/img/sprite/*.png
↓compass
/src/img/sprite.hogehoge.png

/src/img/*.png
↓image
/img/*.png
```
