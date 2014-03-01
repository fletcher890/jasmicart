var jam = {
    "packages": [
        {
            "name": "backbone",
            "location": "libs/backbone",
            "main": "backbone.js"
        },
        {
            "name": "handlebars",
            "location": "libs/handlebars",
            "main": "handlebars.js"
        },
        {
            "name": "jquery",
            "location": "libs/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "underscore",
            "location": "libs/underscore",
            "main": "underscore.js"
        }
    ],
    "version": "0.2.17",
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "underscore": {
            "exports": "_"
        }
    }
};

if (typeof require !== "undefined" && require.config) {
    require.config({
    "packages": [
        {
            "name": "backbone",
            "location": "libs/backbone",
            "main": "backbone.js"
        },
        {
            "name": "handlebars",
            "location": "libs/handlebars",
            "main": "handlebars.js"
        },
        {
            "name": "jquery",
            "location": "libs/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "underscore",
            "location": "libs/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "underscore": {
            "exports": "_"
        }
    }
});
}
else {
    var require = {
    "packages": [
        {
            "name": "backbone",
            "location": "libs/backbone",
            "main": "backbone.js"
        },
        {
            "name": "handlebars",
            "location": "libs/handlebars",
            "main": "handlebars.js"
        },
        {
            "name": "jquery",
            "location": "libs/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "underscore",
            "location": "libs/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "underscore": {
            "exports": "_"
        }
    }
};
}

if (typeof exports !== "undefined" && typeof module !== "undefined") {
    module.exports = jam;
}