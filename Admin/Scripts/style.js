$(function(){
    //$("#btnSubmit").click(function () {
    //  //  alert("--");
    //    checkEndTime();
    //});
});
function checkEndTime() {
    var startTime = $("#realseDate").val();
    var start = new Date(startTime.replace("-", "/").replace("-", "/"));
    var endTime = $("#addDate").val();
    var end = new Date(endTime.replace("-", "/").replace("-", "/"));
    if (end < start) {
        alert("error datetime");
        return false;
    }
    return true;
}