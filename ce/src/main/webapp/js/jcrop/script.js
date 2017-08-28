function bytesToSize(bytes) {
    var sizes = ['Bytes', 'KB', 'MB'];
    if (bytes == 0) return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
};

function checkForm() {
    if (parseInt($('#w').val())) return true;
    $('.error').html('Please select a crop region and then press Upload').show();
    return false;
};
// 更新裁切的图片
function updateInfo(e) {
	var oImage = document.getElementById('preview');
	var multiple=oImage.naturalWidth/800;
    $('#x1').val(Math.floor(e.x*multiple));
    $('#y1').val(Math.floor(e.y*multiple));
    $('#w').val(Math.floor(e.w*multiple));
    $('#h').val(Math.floor(e.h*multiple));
    layer.msg( 'x:'+ $('#x1').val() +'  y:'+ $('#y1').val() +'  w:'+ $('#w').val() +'  h:'+ $('#h').val()  )
};
// clear info by cropping (onRelease event handler)
function clearInfo() {
    $('.info #w').val('');
    $('.info #h').val('');
};
function fileSelectHandler() {

	
    var oFile = $('#image_file')[0].files[0];
    // hide all errors
    $('.error').hide();
    
    // check for image type (jpg and png are allowed)
    var rFilter = /^(image\/jpeg|image\/png)$/i;
    if (! rFilter.test(oFile.type)) {
        $('.error').html('请选择图像文件(jpeg/png)').show();
        return;
    }
    // check for file size
    if (oFile.size > 10240 * 1024) {
        $('.error').html('文件太大，请选择一张稍小点的图片').show();
        return;
    }
    // preview element
    var oImage = document.getElementById('preview');
    // prepare HTML5 FileReader
    var oReader = new FileReader();
    oReader.onload = function(e) {
        // e.target.result contains the DataURL which we can use as a source of the image
        oImage.src = e.target.result;
        oImage.onload = function () { // onload event handler
            // display step 2
            $('.step2').fadeIn(500);
            // display some basic image info
            var sResultFileSize = bytesToSize(oFile.size);
            $('#filesize').val(sResultFileSize);
            $('#filename').val(oFile.name);
            $('#filedim').val(oImage.naturalWidth + ' x ' + oImage.naturalHeight);
            // Create variables (in this scope) to hold the Jcrop API and image size
            var jcrop_api, boundx, boundy;
            // destroy Jcrop if it is existed
            if (typeof jcrop_api != 'undefined')
                jcrop_api.destroy();
            // initialize Jcrop
            $('#preview').Jcrop({
                minSize: [32, 32], // min crop size
                aspectRatio : 1, // keep aspect ratio 1:1
                bgFade: true, // use fade effect
                bgOpacity: .3, // fade opacity
                onChange: updateInfo,
                onSelect: updateInfo,
                onRelease: clearInfo
            }, function(){
                // use the Jcrop API to get the real image size
                var bounds = this.getBounds();
                boundx = bounds[0];
                boundy = bounds[1];
                // Store the Jcrop API in the jcrop_api variable
                jcrop_api = this;
            });
        };
    };
    // Download by http://www.codefans.net
    // read selected file as DataURL
    oReader.readAsDataURL(oFile);
}/**
 * Created by hjx on 2017/3/14.
 */
