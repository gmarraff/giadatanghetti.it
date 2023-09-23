function getMobileOperatingSystem() {
    var userAgent = navigator.userAgent || window.opera;

    if (/android/i.test(userAgent)) {
        return "Android";
    }

    if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream) {
        return "iOS";
    }

    return "Desktop";
}

$(document).ready(function() {
    var operatingSystem = getMobileOperatingSystem();
    if (operatingSystem === "Desktop"){
        return;
    }
    // TODO: iOS needs testing
    $("[data-facebook-id]").each(function(id){
        var element = $(this);
        var baseHref = operatingSystem === "Android" ? "fb://page/" : "fb://profile/";
        var facebookId = element.attr("data-facebook-id");
        element.attr("href", baseHref + facebookId)
    })
});
