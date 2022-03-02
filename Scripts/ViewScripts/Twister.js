function WaitLoad(text, lbl, div) {
    var hTxt = document.getElementById(lbl);
    var div = document.getElementById(div);
    for (let i = 0; i <= 10; i++) {
        (function () {
            let print = function () {
                if (i == 10) {
                    div.hidden = "hidden";
                    hTxt.textContent = text;
                    $("#controlForms").prop('disabled', false);
                }
            };
            setTimeout(print, i * 400);
        })();
    }
}