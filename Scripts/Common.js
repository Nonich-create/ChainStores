var AjaxManager = {

    GETAPI: function (serviceUrl, errorCallback) {
        var array = [];
        $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            type: "GET",
            url: serviceUrl,
            async: false,
            cache: false,
            success: function (data) {
                array = data
            },
            error: errorCallback
        });
        return array;
    },        
    POSTAPI: function (serviceUrl, jsonParams, successCallback, errorCallback) {
        jQuery.ajax({
            url: serviceUrl,
            type: "POST",
            data: jsonParams,
            contentType: "application/json",
            success: successCallback,
            error: errorCallback
        });
    },
    PUTAPI: function (serviceUrl, jsonParams, successCallback, errorCallback) {
        jQuery.ajax({
            url: serviceUrl,
            type: "PUT",
            data: jsonParams,
            contentType: "application/json",
            success: successCallback,
            error: errorCallback
        });
    },
    DELETEAPI: function (serviceUrl, successCallback, errorCallback) {
        jQuery.ajax({
            url: serviceUrl,
            type: "DELETE",
            contentType: "application/json",
            success: successCallback,
            error: errorCallback
        });
    },
}