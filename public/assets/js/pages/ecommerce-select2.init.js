$(".select2").select2();
$(function () {
    // turn the element to select2 select style
    $(".order_tax_rate").select2({
        placeholder: "Select a state",
    })
    .on("change", function (e) {
        var data = $(".order_tax_rate option:selected").text();
        alert(data);
    });
});
