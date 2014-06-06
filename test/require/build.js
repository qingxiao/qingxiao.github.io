/**
 * Created by PA on 2014/6/5.
 *
 * node r.js -o build.js
 */
({
    appDir: "./",
    baseUrl: "js",
    dir: "built",
    removeCombined: true,
    modules: [
        {
            name: "main",
            include: ["module/a","module/b","module/c"]
        }
    ]
})