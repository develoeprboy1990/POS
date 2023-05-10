<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>@font-face Demo</title>
    <style>
        body {
            margin: 0 auto;
            font-size: 10px;
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        body,
        td,
        th {
            font-size: 11px;
        }
    </style>
</head>
<body>
    @foreach($stickerxy as $value2)
    @for($i=1; $i<=$value2->qty; $i++)
        <table width="100%" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="font-size: 14px; white-space: nowrap;">{{$companyName}}</td>
            </tr>
            <tr>
                <td style="font-size: 10px;">{{ucwords($value2->name)}}</td>
            </tr>
            <tr>
                <td colspan="2"> <img src="data:image/png;base64,{{DNS1D::getBarcodePNG($value2->code, 'I25')}}" alt="barcode" />
                </td>
            </tr>
            <tr>
                <td style="font-size: 10px;">{{ $value2->code }} <span style="float: right;">Rs: {{$value2->price}}</span></td>
            </tr>
        </table>
        @endfor
        @endforeach
</body>
</html>