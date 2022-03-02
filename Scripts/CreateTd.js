function CreateTd(elem) {
    if (elem == null) {
        return '<td>' + '<span>' + " " + '</span>' + '</td>'
    }
    else {
        return '<td>' + '<span title="' + elem + '">' + elem + '</span>' + '</td>'
    }
}