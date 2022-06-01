import { toast } from 'react-toastify';

//Declare Global Model
var consoleEnabled = true;//false;
var consoleLevel = "Info"; //Trace, Info, Data

var consoleConfigured = false;
var consoleBuffer = [];//Used to store the log messages prior to console being configured

//Common Helper Functions
//  -> Console
//  -> Data API
//  -> UI Helpers (Message, Confirm...)
const Common = {

    init: function () {

        if (!window.console) window.console = {};
        if (!window.console.log) window.console.log = function () { };
    },

    //#region Message Log

    setLog: function (logConfiguration) {
        consoleEnabled = logConfiguration.consoleEnabled;
        consoleLevel = logConfiguration.consoleLevel;

        if (consoleEnabled) {
            consoleBuffer.forEach(item => {
                Common.writeLog(item.message);
            });
        }
        //Empty the buffer
        consoleBuffer = [];
    },

    trace: function (message, params) {
        this.writeLog("Trace", message, params);
    },

    traceInit: function (component) {
        this.writeLog("Init Trace", component);
    },

    log: function (message, params) {
        this.writeLog(null, message, params);
    },

    logError: function (message, params) {
        this.writeLog("Error", message, params);
    },

    data: function (message, params) {
        this.writeLog("Data", message, params);
    },

    writeLog: function (level, message, params) {

        //Form Message
        if ((params != null) && (params.length > 0)) {
            var i = params.length;
            while (i--) {
                message = message.replace(new RegExp('\\{' + i + '\\}', 'gm'), params[i]);
            }
        }
        if (level != null) {
            message = level + ". " + message;
        }

        //While the console is being configured. Messages are stored in a temporal buffer
        if (!consoleConfigured) {
            consoleBuffer.push({ message: message });
        }

        if (consoleEnabled) {
           if (window.console && window.console.log) {
                if (consoleEnabled) {
                    window.console.log(message);
                }
            }
        }
    },


    //#endregion

    //#region Invoke Call 

    call: async function (url, requestParameter, callback, callbackData, callbackError) {

        Common.data("Call URL -> {0}", [url]);

        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestParameter)
        }).catch((err) => {
            Common.data("Call Catch Error Block {0} -> ", [url]);
            Common.log(err);
        });

        const apiResponse = await response.json();

        Common.data("Common.Call API Response -> {0}", [url]);
        Common.log(apiResponse);

        if (apiResponse.success === true) {

            if ((callbackData) && (callbackData.successMessage)) {
                Common.success(callbackData.successMessage);
            }

            if (callback != null) {
                callback(apiResponse.value, callbackData, apiResponse);
            }
        } else {
            Common.data("Common.Call Failed {0} -> ", [url]);

            if ((callbackData) && (callbackData.errorMessage)) {
                Common.error(callbackData.errorMessage);
            }

            if (apiResponse.errors != null) {
                var error;
                for (error in apiResponse.errors) {
                    if ((apiResponse.errors[error] != null) && (apiResponse.errors[error].length > 0)) {
                        Common.error(apiResponse.errors[error]);
                    } else {
                        Common.error(error);
                    }
                }
            } else {
                Common.error("Operation Failed. Reach Administrator for more information.");
            }

            if (callbackError != null) {
                Common.data("Common.Call Callback Error");
                callbackError(callbackData, apiResponse.data);
            }
        }
    },

    //#endregion

    //#region UI Messages

    success: function (message) {

        toast.success(message, {
            position: "top-right",
            autoClose: 8000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
        });
    },
    error: function (message) {

        toast.error(message, {
            position: "top-right",
            autoClose: 10000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
        });
    },

    //#endregion

    //#region Images

    ImportAllImagesInFolder(r) {
        let imageArray = [];
        r.keys().map(r).map((item, index) => { imageArray.push({ src: item, header: '', key: index, caption: '', altText: '' }); return false; });
        return imageArray;
    }

    //#endregion
}

export default Common;

