function CheckValidation(errorSummary, validationSum) {
    var divError = document.getElementById(errorSummary);
    var validationSummary = document.getElementById(validationSum);
    if (validationSummary.textContent == '\n\n') {
        divError.hidden = true;
    }
    else {
        divError.hidden = false;
    }
};
 