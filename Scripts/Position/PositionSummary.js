var PositionSummaryManager = {
    GetPosition: function () {
        console.log(123);
        var objPosition = "";
        var serviceUrl = "https://localhost:44375/GetPositionAll";
        AjaxManager.GETAPI(serviceUrl, onSuccess, onFailed)
        function onSuccess(jsonData) {
            objPosition = jsonData;
        }
        function onFailed(error) {
            alert(error.statusText)
        }
        return objPosition;
    }
};

var PositionSummaryHelper = {
    InitPositionSummary: function () {
        PositionSummaryHelper.LoadPosition();
    },

    LoadPosition: function () {
        var positionList = PositionSummaryManager.GetPositon();
        $.each(positionList, function (i, pos) {
            var rows = "<tr>" +
                "<td>" + pos.Id + "</td>" +
                "<td>" + pos.CodePosition + "</td>" +
                "<td>" + pos.Title + "</td>" +
                "</tr>";
            $('#Table tbody').append(rows);
        });
    }
}