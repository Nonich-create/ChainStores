const { error } = require("jquery");

async function AddPosition(position, url) {
    await $.ajax({
        headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
        url: url + '/AddPosition',
        type: 'POST',
        data: JSON.stringify(position),
        contentType: "application/json",
        success: function (data) {
            alert('Successful saving');
        },
        error: function () {
            alert('Saving error');
        }
    });
}

async function UpdatePosition(Title, JobDescriptions, Info, CodePosition, Salary, Id) {
 
    var position = {
        CodePosition: CodePosition,
        Salary: Salary,
        JobDescriptions: JobDescriptions,
        Info: Info,
        Title: Title,
        Id: Id
    };
    await $.ajax({
        headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
        url: webApi.value + '/UpdatePosition',
        type: 'PUT',
        data: JSON.stringify(position),
        contentType: "application/json",    
        success: function (data) {
            alert('Successful saving');
        },
        error: function () {
            alert('Saving error');
        }
    });
}

async function getPositions(url) {
    var array = [];
    await $.ajax({
        headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
        url: url + '/GetPositionAll',
        type: 'GET',
        success: function (data) {
            array = data;
        },
        error: function () {
            alert('Error getting data');
        }
    });
    return array;
}

async function deletePosition(Id, url) {
    await $.ajax({
        headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
        url: url + '/DeletePosition?Id=' + Id,
        type: 'DELETE',
        success: function () {
            alert('Successful deletion');
        },
        error: function () {
            alert('Deletion Error');
        }
    });
}

async function searchPositions(stringSearch, url) {
    var array = [];
    await $.ajax({
        headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
        url: url + '/Api/Position?stringSearch=' + stringSearch,
        type: 'GET',
        success: function (data) {
            array = data;
            if (array.length <= 0) {
                alert('There were no positions according to the current criterion');
            }
        },
        error: function () {
            alert('Search error');
        }
    });
    return array;
}