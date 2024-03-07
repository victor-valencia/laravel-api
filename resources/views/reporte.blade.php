<!DOCTYPE html>
<html>
<head>
    <title>{{ $title }}</title>
</head>
<body>

<style> 
    .code {
        border: 1px solid grey;
        width: 216px;
        padding: 2px;
        /* margin: 2px; */
    }
    .code > div {
        margin: 2px 20px;
        height: 36px !important;
    }
</style>

    <img src="{{public_path('images/Logo VVR.png')}}" alt="Logo" height="75px">

    <p style="text-align: center; background-color: #ecf0f1; padding: 6px;"><b>{{ $title }}</b></p>

    <div class="code">
        <p style="text-align: center; margin: 0;">$100.00 c/u</p>
        {!! DNS1D::getBarcodeHTML('2208-T001', 'C39', 1, 50, '#2A3239', true, true); !!}
        <p style="text-align: center; margin: 0;">2208-T001</p>
    </div>

    <div class="code-qr" style="padding-top: 30px;">
        {!! DNS2D::getBarcodeHTML('2208-T001', 'QRCODE'); !!}
    </div>

    <!-- <img src="data:image/png;base64,' . DNS1D::getBarcodePNG('2208-T001', 'C39+', 3, 33); . '" alt="barcode"   /> -->
</body>
</html>