/*
  Solid Framework
  Startup script
*/

// Global namespace for Solid
var solid = {};
solid.components = {};

// Set to zero to prevent logging
solid.debugLevel = 1;

solid._packages = {};

/*
 * Load components and required files.
 *
 * the first parameter is an array of values with all the required files. Each file is specified
 * in a format like java package. For example solid.Application loads the file framework/src/application.js
 * and make Application available in the passed S object as S.Application
 *
 * Example:
 * SOLID.load("solid.Application", function(S){
 *  console.log(S.Application);
 * });
 *
 * It takes various schema:
 * solid.*: load files from framework directory, it try to find the framework path from the
 *          position of this file but you can override it specifying a global SOLID_PATH variable
 * libs.*:  load the file from framework libs
 *
 * you can define news package using SOLID.definePackage();
 *
 * If the requested file has a "/" character it loads the file considering the request as the path of the file.
 */
solid.load = function(requirements, callback){
    // if SOLID_PATH is defined prepend the path to each file required

    if(!window.SOLID_PATH){

        // Define SOLID_PATH using the path of this file
        var url = window.location.pathname;
        var path;
        jQuery('script').each(function(index, element){
            if(jQuery(element).data("init") == true){
                path = jQuery(element).attr('src');
            }
        });

        var urlPieces = url.split("/");
        var pathPieces = path.split("/");
        var backCounter = 0;
        for(var i = 0; i < pathPieces.length; i++){
            if(pathPieces[i] == ".."){
                backCounter ++;
            }
        }

        path = path.replace(pathPieces[pathPieces.length - 1], "");
        path = path.replace(/\.\.\//gi, "");

        var solidPath = window.location.origin;
        for(i = 0; i < urlPieces.length - 1 - backCounter; i++){
            if(urlPieces[i].length > 0){
                solidPath += "/";
                solidPath += urlPieces[i];
            }
        }

        solidPath += "/" + path;

        window.SOLID_PATH = solidPath.substring(0, solidPath.length-1);
    }

    var urls = [];
    var fileNames = [];

    for(var i = 0; i < requirements.length; i++){

        var path = requirements[i];

        if(path.indexOf("/") >= 0){
            // This is NOT a package it's a real path
            urls.push(path);
        }else{
            var pathPieces = path.split(".");
            var fileName = pathPieces[pathPieces.length - 1];

            fileNames.push({
                package: path,
                object: fileName
            });

            // Repalce default packages
            pathPieces[0] = solid._packages[pathPieces[0]];

            // Recreate the url
            pathPieces[pathPieces.length - 1] = "";
            path = pathPieces.join("/");
            path = path.replace("${SOLID_PATH}", window.SOLID_PATH);
            path += fileName + ".js";

            // Append the modified URL the list that has to be loaded.
            urls.push(path);console.log(path);

        }

    }

    var internalCallback = function(){
        var parameter = {};
        for(var i = 0; i < fileNames.length; i++){
            var fn = fileNames[i];

            try{
                if(eval(fn.package)){
                    parameter[fn.object] = fn.package;
                };
            }catch(e){

            }
        }

        callback(parameter);

    }

    require(urls, internalCallback);
}

/*
 * Define a new package to be used with SOLID.load
 * @parameter name: the name of the parameter used in the SOLID.load() requirements list
 * @parameter path: the path of the package
 * */
solid.definePackage = function(name, path){
    solid._packages[name] = path;
}

// Specify standards path, you can use ${SOLID_PATH} to specify the
// Solid home directory, epecially
solid.definePackage("libs", "${SOLID_PATH}/libs");
solid.definePackage("solid", "${SOLID_PATH}");

solid.load(['libs.jquery',
            'libs.classy',
            'solid.Logger',
            'solid.Application'], function(S) {

    // Don't interfere with the rest of the world
    S.Class = Class.$noConflict();
    jQuery.noConflict()

});
