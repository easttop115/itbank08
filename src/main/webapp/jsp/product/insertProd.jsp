<html
  class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase no-indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>셀매니저</title>
  <script src="../smg_system/js/jquery-3.2.0.min.js"></script>
  <link rel="stylesheet" href="../smg_system/jquery-ui-1.11.4.custom/jquery-ui.css">
  <script src="../smg_system/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
  <script src="../smg_system/js/xml2json.js"></script>
  <script src="../smg_system/js/modernizr.js"></script>
  <script src="../smg_system/js/ajax.min.js"></script>
  <link href="../smg_system/css/jquery.modal.css" type="text/css" rel="stylesheet">
  <link href="../smg_system/css/jquery.modal.theme-xenon.css" type="text/css" rel="stylesheet">
  <link href="../smg_system/css/jquery.modal.theme-atlant.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="../smg_system/js/jquery.modal.min.js"></script>
  <link rel="stylesheet" href="../smg_system/css/style.css">

  <link rel="apple-touch-icon" sizes="180x180" href="../smg_system/favicon/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="../smg_system/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="../smg_system/favicon/favicon-16x16.png">
  <link rel="manifest" href="../smg_system/favicon/site.webmanifest">
  <link rel="mask-icon" href="../smg_system/favicon/safari-pinned-tab.svg" color="#5bbad5">
  <meta name="msapplication-TileColor" content="#da532c">
  <meta name="theme-color" content="#ffffff">

  <!-- tui-chart -->
  <link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
  <script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.min.js"></script>
  <script type="text/javascript" src="https://uicdn.toast.com/tui.chart/latest/raphael.js"></script>
  <script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>
  <script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-polyfill.js"></script>

</head>

<body>


  <table class="table_body">
    <tbody>
      <tr class="th_body">
        <td class="td_body100">



          <div style="float:left;width:40%;">

            <div id="app_title_div" style="width:100%;margin:0px 0px 10px 0px;">
              <div id="div_title">
                <div style="float:left;width:40px;"><img src="../../smg_system/image/title_icon.png"></div>
                <div style="float:left;padding-top:5px;">1단계: 상품기본정보 등록</div>
                <div style="clear:both;"></div>
              </div>
            </div>
            <div style="margin:0px 10px 20px 0px;">

              <!-- 상품 기본 정보 등록 폼 //-->
              <div id="div_01" style="width:100%;">
                <form id="my_form1" name="my_form1" method="POST" enctype="multipart/form-data">
                  <div style="margin:0px 0px 20px 0px;">
                    <table class="table1">
                      <tbody>
                        <tr class="th1">
                          <td class="td1_1">상품명 <img src="../../smg_system/image/filsu.png" title="필수입력"></td>
                          <td class="td1_2"><input type="text" id="goods_name" name="goods_name" class="form_text"
                              style="width:100%;" maxlength="100" placeholder="상품명을 입력하세요"></td>
                        </tr>
                        <tr class="th1">
                          <td class="td1_1">거래처지정</td>
                          <td class="td1_2"><select id="gurechu_num" name="gurechu_num" class="form_select"
                              style="width:100%;;">
                              <option value="">선택</option>
                              <option value="209">공덕</option>
                              <option value="214">니오</option>
                              <option value="212">마운트리버</option>
                              <option value="213">메드아웃도어</option>
                              <option value="211">스노우라인</option>
                              <option value="215">엠케이아웃도어</option>
                              <option value="210">우묵배미</option>
                            </select></td>
                        </tr>
                        <tr class="th1">
                          <td class="td1_1">입고가격 <img src="../../smg_system/image/filsu.png" title="필수입력"></td>
                          <td class="td1_2"><input type="text" id="ipgo_price" name="ipgo_price" class="form_text"
                              style="width:200px;text-align:right;" maxlength="15"
                              onkeyup="this.value=number_filter(this.value);" placeholder="숫자로 입력하세요"> 원</td>
                        </tr>
                        <tr class="th1">
                          <td class="td1_1">출고(판매)가격 <img src="../../smg_system/image/filsu.png" title="필수입력"></td>
                          <td class="td1_2"><input type="text" id="chulgo_price" name="chulgo_price" class="form_text"
                              style="width:200px;text-align:right;" maxlength="15"
                              onkeyup="this.value=number_filter(this.value);" placeholder="숫자로 입력하세요"> 원</td>
                        </tr>
                        <tr class="th1">
                          <td class="td1_1">상품설명</td>
                          <td class="td1_2"><textarea id="etc" name="etc" class="form_text"
                              style="width:100%;;height:200px;" placeholder="상품 상세 설명을 입력하세요"></textarea></td>
                        </tr>
                        <tr class="th1">
                          <td class="td1_1">상품사진</td>
                          <td class="td1_2"><input type="file" id="sell_file" name="sell_file" style="width:100%;;">
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div style="text-align:center;margin:0 auto;"><input type="button"
                      value="상품기본정보 등록완료 &amp; 상품옵션 등록하기 >" class="button1" onclick="goods_submit();"></div>
                </form>
              </div>

            </div>

          </div>
          <div style="float:left;width:60%;">

            <div id="app_title_div" style="width:100%;margin:0px 0px 10px 0px;">
              <div id="div_title">
                <div style="float:left;width:40px;"><img src="../../smg_system/image/title_icon.png"></div>
                <div style="float:left;padding-top:5px;">2단계: 상품옵션 등록</div>
                <div style="clear:both;"></div>
              </div>
            </div>
            <div id="div_02" style="margin:0px 0px 20px 0px;">

              <!-- 상품 옵션 등록 폼 //-->
              <div style="width:100%;text-align:center;">
                <div style="width:200px;margin:0 auto;padding:100px 0 50px 0;"><img
                    src="../../smg_system/image/toothedwheel1.png"></div>
                <span class="nothing_info"><b>1단계: 상품기본정보</b>를 먼저 등록해주세요.</span>
              </div>
            </div>

          </div>
          <div style="clear:both;"></div>


          <!-- 도움말 //-->
          <div style="width:100%;margin:20px 0px 2px 0px;"><img src="../../smg_system/image/help_icon.png"></div>
          <div
            style="width:100%;margin:0px 0px 0px 0px;border:1px solid #DAED29;border-radius:5px;background-color:#FCFEDC;">
            <div style="padding:5px 5px 5px 5px;">- <b>1단계:상품기본정보</b> 등록 후 우측 <b>2단계:상품옵션</b>을 등록합니다.</div>
            <div style="padding:0px 5px 5px 5px;">- <b>거래처지정:</b> 거래처를 지정 할 경우 입출고 개별 등록 시 해당 거래처의 보유 재고량에 반영됩니다. 거래처
              정보는 거래처 메뉴에서 등록 할 수 있습니다.</div>
            <div style="margin:0px 5px 5px 5px;">- <b>2단계:상품옵션</b> 등록에서 최소 1개 이상의 상품 옵션(사이즈,색상 등)과 바코드가 반드시 등록되어야 합니다.
            </div>
            <div style="margin:0px 5px 5px 5px;">- 바코드가 없는 상품인 경우 다른 상품 바코드와 중복되지 않는 임의의 숫자로 등록해주세요. 등록된 바코드는 등록상품관리에서
              변경 할 수 있습니다. 바코드 자동생성에 체크하시면 바코드를 입력하지 않아도 자동 등록됩니다.</div>
            <div style="margin:0px 5px 5px 5px;">- 상품 옵션별 출고(판매)가격은 상품기본정보의 출고(판매)가격 보다 우선하여 입출고(판매)등록시 반영됩니다.</div>
            <div style="margin:0px 5px 5px 5px;">- <b>적립금</b>은 입출고(판매) 등록시 고객을 지정 할 경우 해당 고객에게 적립금이 적립됩니다. 고객 메뉴에서 적립금을
              확인 할 수 있습니다.</div>
            <div style="margin:0px 5px 5px 5px;">- 2단계:옵션등록까지 완료되면 상품등록이 완료됩니다. 새 상품 추가 등록은 1단계:상품기본정보 등록 부터 다시 진행합니다.
            </div>
          </div>
          <!-- 상품 등록 폼 end //-->


        </td>
      </tr>
    </tbody>
  </table>







  </div>




  </div>
  <iframe id="Main_Frame" name="Main_Frame" width="0" height="0" frameborder="0"></iframe>
  <iframe id="Session_Frame" name="Session_Frame" width="0" height="0" frameborder="0" src="./session.php"></iframe>









  <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>

</html>