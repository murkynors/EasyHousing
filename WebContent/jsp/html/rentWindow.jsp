<%@page import="com.easyhousing.model.RentHouse"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.Math"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <%
  HttpSession s = request.getSession(); 
  String strtemp;
  %>
  <title>租房</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
      margin: 0;
      padding: 0;
    }
    body {
      height: 100%;
      font-size: 12px;
      color: #333;
      background: #f2f2f2;
      min-width: 1220px;
    }
    .listhead {
      height: 60px;
      background:  #333;
    }
    .headerbg {
      width: 100%;
      height: 50px;
      position: relative;
    }
    .listhead .header {
      height: 60px;
      padding: 0;
      line-height: 60px;
    }
    .header {
      width: 1220px;
      height: 50px;
      line-height: 50px;
      font-size: 14px;
      color: #fff;
      margin: auto;
      padding-top: 20px;
      position: relative;
    }
    .listhead .header .logo {
      width: 140px;
      margin-top: 6px;
    }
    .header .logo {
      width: 160px;
      float: left;
    }
    .listhead .header .nav {
      height: 60px;
      font-size: 25px;
    }
    .header .nav {
      width: 850px;
      height: 50px;
      float: left;
      font-size: 18px;
      font-weight: bold;
      margin-left: 100px;
    }
    .listhead .header .nav span {
      height: 60px;
      margin: 0;
    }
    .listhead .header .nav span .hrf {
      height: 60px;
      line-height: 60px;
      margin: 0;
      padding: 0 18px;
      border: 0;
    }
    .header a {
      color: #fff;
    }
    .wsrrent {
      width: 100%;
      border-bottom: 1px solid #ddd;
      background: #fff;
      margin-bottom: 20px;
      box-shadow: 0 2px 2px #e1e1e1;
    }
    .wsrrent .container {
      width: 1220px;
    }
    .container {
      width: 1200px;
      margin: auto;
    }
    .subsh {
      height: 35px;
      padding: 10px 0;
    }
    .subsh_l {
      width: 388px;
      height: 33px;
      border: 1px solid #bbb;
      position: relative;
      background: #fff;
    }
    .fl {
      float: left;
    }
    .subsh_l .sd_sel {
      width: 60px;
      height: 33px;
      font-size: 14px;
      padding-left: 5px;
      position: relative;
      margin-right: 5px;
    }
    .subsh_l .sd_sel span {
      width: 50px;
      padding-right: 8px;
      text-align: center;
      height: 33px;
      line-height: 33px;
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg23.png) no-repeat right center;
      display: block;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      cursor: pointer;
    }
    .subsh_l .sd_sel ul {
      width: 50px;
      position: absolute;
      top: 33px;
      left: 0;
      z-index: 99;
      background: #fff;
      border: 1px solid #888;
      padding: 5px;
      display: none;
    }
    .subsh_l .sd_sel ul li {
      line-height: 24px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      cursor: pointer;
    }
    ol, ul, li {
      list-style: none;
    }
    .subsh_l .text {
      width: 260px;
      height: 18px;
      line-height: 18px;
      padding: 0 10px;
      float: left;
      margin-top: 7px;
      border: 0;
      background: 0;
      color: #888;
    }
    input[type="text"], input[type="passwrod"] {
      outline: none;
    }
    input {
      -webkit-appearance: textfield;
      background-color: white;
      -webkit-rtl-ordering: logical;
      user-select: text;
      cursor: auto;
      padding: 1px;
      border-width: 2px;
      border-style: inset;
      border-color: initial;
      border-image: initial;
    }
    .subsh_l #autoSearchItem {
      width: 100%;
      top: 34px;
      left: -1px;
      z-index: 9999;
    }
    #autoSearchItem {
      width: 600px;
      background: #fff;
      border: 1px solid #ddd;
      position: absolute;
      top: 50px;
      left: 0;
      visibility: hidden;
    }
    .subsh_l .submit {
      width: 35px;
      height: 33px;
      float: right;
      font-size: 0;
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg24.png) no-repeat center center;
      border: none;
    }
    input[type="button"], input[type="file"], input[type="submit"], input[type="reset"] {
      -webkit-appearance: none;
      border: none;
      cursor: pointer;
      outline: none;
      border: 0;
    }
    .subsh_r {
      width: 158px;
      height: 35px;
      border-radius: 5px;
      font-size: 14px;
      font-weight: bold;
      overflow: hidden;
    }
    .fr {
      float: right;
    }
    .subsh_r .al {
      width: 85px;
      height: 31px;
      line-height: 31px;
      border: 2px solid #ddd;
      border-right: none;
      border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;
      color: #333;
    }
    .subsh_r a {
      height: 35px;
      line-height: 35px;
      text-align: center;
      float: left;
      overflow: hidden;
      display: block;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .subsh_r .al span {
      padding-left: 15px;
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg25.png) no-repeat left center;
    }
    .subsh_r a span {
      display: inline-block;
    }
    strong, b {
      font-weight: bold;
    }
    .subsh_r .al span i {
      display: none;
    }
    i, em {
      font-style: normal;
    }
    .bodywhitew {
      width: 1220px;
      margin-bottom: 10px;
    }
    .container {
      width: 1200px;
      margin: auto;
    }
    .current {
      width: 1205px;
      margin: auto;
      font-size: 14px;
      height: 32px;
      line-height: 32px;
      color: #666;
      padding-left: 15px;
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg25.png) no-repeat left center;
      overflow: hidden;
    }
    .current a {
      color: #666;
    }
    .nv_list {
      position: relative;
    }
    .nv_list .nvtit {
      width: 100%;
      height: 40px;
      border-bottom: 1px solid #ddd;
      overflow: hidden;
      background: #fff;
    }
    ol, ul, li {
      list-style: none;
    }
    .nv_list .nvtit li.active {
      color: #c00000;
    }
    .nv_list .nvtit li {
      height: 40px;
      line-height: 40px;
      padding: 0 15px;
      float: left;
      font-size: 16px;
      color: #666;
      font-weight: bold;
      cursor: pointer;
    }
    .nv_list .nvtit li.active span {
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/ppimg15-1.png) no-repeat center center;
      display: none;
    }
    .nv_list .nvtit li span {
      width: 14px;
      height: 40px;
      vertical-align: middle;
      display: inline-block;
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/ppimg15.png) no-repeat center center;
      margin-left: 2px;
      font-size: 0;
    }
    .nv_menu {
      border-top: none;
      display: none;
      background: #fff;
    }
    .nv_menu ul {
      padding: 10px 20px 0 20px;
    }
    .nv_menu li {
      padding: 6px 0;
      font-size: 14px;
      line-height: 24px;
    }
    .nv_menu li strong {
      font-weight: bold;
    }
    .nv_menu li .on {
      color: #c00000;
      font-weight: bold;
    }
    .nv_menu li a {
      display: inline-block;
      cursor: pointer;
      margin-right: 20px;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .nv_menu li .ipt1 {
      width: 40px;
      height: 18px;
      border: 1px solid #ccc;
      text-align: center;
      margin-right: 3px;
    }
    input[type="text"], input[type="passwrod"] {
      outline: none;
    }
    .list_tit {
      width: 100%;
      height: 35px;
      line-height: 35px;
      font-size: 14px;
      margin-top: 10px;
      border-bottom: 1px solid #ccc;
      overflow: hidden;
    }
    .list_tit .cenl {
      width: 500px;
      height: 35px;
      overflow: hidden;
    }
    .fl {
      float: left;
    }
    .list_tit .cenl strong {
      color: #c00000;
      font-weight: bold;
    }
    i, em {
      font-style: normal;
    }
    .list_tit .cenr {
      width: 600px;
      height: 35px;
      text-align: right;
      overflow: hidden;
    }
    .fr {
      float: right;
    }
    .list_tit a.first {
      margin: 0;
    }
    .list_tit .active {
      font-weight: bold;
      color: #c00000;
    }
    .list_tit a {
      margin-left: 10px;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .list_tit .hovs {
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg80.png) no-repeat right center;
    }
    .list_tit .hovs, .list_tit .hovx {
      padding-right: 10px;
    }
    .list_tit a {
      margin-left: 10px;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .list_tit .hovx {
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg81.png) no-repeat right center;
    }
    .list_tit .hovs, .list_tit .hovx {
      padding-right: 10px;
    }
    .list_tit a {
      margin-left: 10px;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    ol, ul, li {
      list-style: none;
    }
    ul, menu, dir {
      display: block;
      list-style-type: disc;
      -webkit-margin-before: 1em;
      -webkit-margin-after: 1em;
      -webkit-margin-start: 0px;
      -webkit-margin-end: 0px;
      -webkit-padding-start: 40px;
    }
    .mor_list li {
      height: 190px;
      padding: 20px 10px 20px 195px;
      background: #fff;
      border-bottom: 1px solid #eee;
      overflow: hidden;
      cursor: pointer;
      position: relative;
    }
    .data_link {
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      z-index: 200;
      display: block;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .mor_list li .mor_img {
      width: 185px;
      height: 150px;
      overflow: hidden;
      background: #ccc;
      position: absolute;
      top: 20px;
      left: 10px;
      z-index: 1;
      font-size: 14px;
      font-weight: bold;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .mor_list li .mor_img img {
      width: 100%;
      height: 100%;
    }
    fieldset, img {
      border: 0;
    }
    .mor_list li .mor_txt {
      width: 100%;
      height: 150px;
      margin-left: 10px;
      position: relative;
    }
    .mor_list li .mor_txt h3 {
      height: 23px;
      font-size: 18px;
      font-weight: bold;
      line-height: 20px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
    }
    .mor_list li .mor_txt .dot {
      width: 100%;
      height: 48px;
    }
    .mor_list li .mor_txt p {
      width: 100%;
      height: 24px;
      margin-top: 10px;
      line-height: 24px;
      font-size: 14px;
      color: #666;
      overflow: hidden;
    }
    .mor_list li .mor_txt .dor {
      height: 24px;
      padding-left: 15px;
      background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg25.png) no-repeat left center;
      white-space: nowrap;
      text-overflow: ellipsis;
    }
    p {
      display: block;
      -webkit-margin-before: 1em;
      -webkit-margin-after: 1em;
      -webkit-margin-start: 0px;
      -webkit-margin-end: 0px;
    }
    .mor_list li .mor_txt a {
      height: 22px;
      line-height: 22px;
      display: block;
      float: left;
      margin-right: 5px;
      border: 1px solid;
      padding: 0 5px;
      cursor: default;
    }
    .bq_cor_1, .bq_cor_11, .bq_cor_21, .bq_cor_31, .bq_cor_41, .bq_cor_51, .bq_cor_61, .bq_cor_71, .bq_cor_81, .bq_cor_91, .bq_cor_101, .bq_cor_111, .bq_cor_121, .bq_cor_131, .bq_cor_141, .bq_cor_151, .bq_cor_161, .bq_cor_171, .bq_cor_181, .bq_cor_191 {
      color: #ff943e;
      border-color: #ff943e;
    }
    .bq_cor_2, .bq_cor_12, .bq_cor_22, .bq_cor_32, .bq_cor_42, .bq_cor_52, .bq_cor_62, .bq_cor_72, .bq_cor_82, .bq_cor_92, .bq_cor_102, .bq_cor_112, .bq_cor_122, .bq_cor_132, .bq_cor_142, .bq_cor_152, .bq_cor_162, .bq_cor_172, .bq_cor_182, .bq_cor_192 {
      color: #9a89b9;
      border-color: #9a89b9;
    }
    .bq_cor_3, .bq_cor_13, .bq_cor_23, .bq_cor_33, .bq_cor_43, .bq_cor_53, .bq_cor_63, .bq_cor_73, .bq_cor_83, .bq_cor_93, .bq_cor_103, .bq_cor_113, .bq_cor_123, .bq_cor_133, .bq_cor_143, .bq_cor_153, .bq_cor_163, .bq_cor_173, .bq_cor_183, .bq_cor_193 {
      color: #47a8d9;
      border-color: #47a8d9;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .mor_list li .mor_tip:last-child {
      right: 0;
    }
    .mor_list li .mor_w {
      width: 240px;
    }
    .mor_list li .mor_tip {
      width: 140px;
      text-align: center;
      font-size: 14px;
      line-height: 18px;
      overflow: hidden;
      position: absolute;
      top: 65px;
      right: 170px;
      z-index: 1;
    }
    .mor_list li .mor_tip p {
      height: 30px;
      line-height: 30px;
    }
    .mor_list li .mor_tip strong {
      color: #c00000;
      font-weight: bold;
      font-size: 30px;
    }
    .mor_list li .mor_tip:last-child {
      right: 0;
    }
    .mor_list li .mor_w {
      width: 240px;
    }
    .mor_list li .mor_tip {
      width: 140px;
      text-align: center;
      font-size: 14px;
      line-height: 18px;
      overflow: hidden;
      position: absolute;
      top: 65px;
      right: 170px;
      z-index: 1;
    }
    #pagination {
      width: 100%;
      font-size: 16px;
      text-align: center;
      padding: 10px 0;
      clear: both;
      background: #fff;
      overflow: hidden;
    }
    .pagination .sel.next, .pagination .sel.prev {
      color: #333;
      border-color: #666;
    }
    .pagination .sel {
      color: #c00000;
      border-color: #c00000;
    }
    .pagination a, .pagination span {
      min-width: 16px;
      height: 32px;
      line-height: 32px;
      border: 1px solid #666;
      text-align: center;
      margin: 5px 2px;
      padding: 0 8px;
      display: inline-block;
      vertical-align: top;
      cursor: pointer;
    }
    * {
      font-family: "Microsoft YaHei",Helvetica,sans-serif;
      font-family: "微软雅黑", Helvetica, Arial, sans-serif;
      word-break: break-all;
    }
  </style>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js "></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js "></script>
<script type="text/javascript">
  
	function transp() {
		$.ajax({
			type : "GET",
			async : false,
			url : "${pageContext.request.contextPath}/rentHouseSelectAjax.do"
		})
	}

	function setCookie(c_name, value, expiredays) {
		var exdate = new Date()
		exdate.setDate(exdate.getDate() + expiredays)
		document.cookie = c_name
				+ "="
				+ escape(value)
				+ ((expiredays == null) ? "" : ";expires="
						+ exdate.toGMTString())
	}

	function clickArea1(id, address) {
		setCookie("address", address, 365);
		setCookie("class1", id, 365);
		transp();
		window.location.reload(false);
	}

	function clickArea2(id, lowPrice, highPrice) {
		setCookie("class2", id, 365);
		setCookie("lowPrice", lowPrice, 365);
		setCookie("highPrice", highPrice, 365);
		transp();
		window.location.reload(false);
	}
	
	function clickArea3(id, lowRoomNum, highRoomNum) {
		setCookie("class3", id, 365);
		setCookie("lowRoomNum", lowRoomNum, 365);
		setCookie("highRoomNum", highRoomNum, 365);
		transp();
		window.location.reload(false);
	}
</script>
</head>
<body>
  <div class="fotpof">
    <div class="pofcons pofsoll pofcont">
      <span></span>
      <div>
      </div>
    </div>
    <div class="headerbg listhead">
      <div class="header">
        <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp>
          <img src=${pageContext.request.contextPath}/jsp/images/rentWindow/logo1.png class="logo" >
        </a>
        <div class="nav navml">
          <span>
            <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="href">首页</a>
          </span>
          <span>
            <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="href">二手房</a>
          </span>
          <span>
            <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="href">新房</a>
          </span>
          <span>
            <a href=${pageContext.request.contextPath}/jsp/html/rentHouse.jsp class="href">租房</a>
          </span>
          <span>
            <% 
              if (s.getAttribute("user") == null) {
            	  out.println("<a href=/EasyHousing/jsp/html/logIn.jsp class=\"href\">登录</a>");
              }
              else {
            	  out.println("<a href=/EasyHousing/userCenter.do class=\"href\">个人中心</a>");
              }
             %>
          </span>
          <span>
            <a href=${pageContext.request.contextPath}/jsp/html/register.jsp class="href">注册</a>
          </span>
        </div>
      </div>

    </div>
    <div class="wsrrent">
      <div class="container">
        <div class="subsh subsher">
          <div class="subsh_l fl">
            <div class="sd_sel fl">
              <span>新房</span>
              <ul id="serchar">
                <li>
                  二手房
                </li>
                <li class="sel">
                  新房
                </li>
                <li>
                  租房
                </li>
              </ul>
            </div>
            <input type="text" value="请输入小区、地铁、区域开始找房" class="text" id="autoSearchText" maxlength="20" autocomplete="off">
            <div id="autoSearchItem" style="height: 285px; visibility: hidden;">
              <ul class="menu_v"></ul>
            </div>
            <input type="button" value class="submit" id="btnSearch" onclick="indexSerch()">
            <input type="hidden" value="1" id="pageIndex">
          </div>
          <div class="subsh_r fr">
            <a href="#" class="al">
              <span>
                <b>地图找房</b>
                <i>地图</i>
              </span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="container bodywhitew">
      <div class="current">
        当前位置：
        <a href="#" target="_blank">易购房</a>
        >
        <span>
          <a href="#" target="_blank">租房</a>
        </span>
      </div>
      <div class="nv_list">
        <ul class="nvtit">
          <li class="active">
            租房
            <span></span>
          </li>
        </ul>
        <div class="nv_menu nv_menut" style="display: block;">
          <ul id="qybox">
            <li class="Switch">
            <%
            strtemp = (String)s.getAttribute("class1");
            System.err.print("id" + strtemp);
            %>
              <strong>区域:</strong>
              <a class= "
              <%
              if(strtemp.equals("0"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="0" onclick="clickArea1(this.id, '重庆');"> 不限 </a>
              <a class="
              <%
              if(strtemp.equals("1"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="1" onclick="clickArea1(this.id, '九龙坡');">九龙坡</a>
              <a class="
              <%
              if(strtemp.equals("2"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="2" onclick="clickArea1(this.id, '渝中');">渝中区</a>
              <a class="
              <%
              if(strtemp.equals("3"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="3" onclick="clickArea1(this.id, '江北');">江北区</a>
              <a class="
              <%
              if(strtemp.equals("4"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="4" onclick="clickArea1(this.id, '南岸');">南岸区</a>
              <a class="
              <%
              if(strtemp.equals("5"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="5" onclick="clickArea1(this.id, '沙坪坝');">沙坪坝区</a>
              <a class="
              <%
              if(strtemp.equals("6"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="6" onclick="clickArea1(this.id, '渝北');">渝北区</a>
              <a class="
              <%
              if(strtemp.equals("7"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="7" onclick="clickArea1(this.id, '大渡口');">大渡口区</a>
              <a class="
              <%
              if(strtemp.equals("8"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="8" onclick="clickArea1(this.id, '巴南');">巴南区</a>
              <a class="
              <%
              if(strtemp.equals("9"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="9" onclick="clickArea1(this.id, '北碚');">北碚区</a>
              <a class="
              <%
              if(strtemp.equals("10"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="10" onclick="clickArea1(this.id, '江津');">江津区</a>
            </li>
            <li class="Switch">
              <strong>地铁:</strong>
              <a class="mt on" id="bx">不限</a>
              <a class="qy" id="11">1号线</a>
              <a class="qy" id="12">2号线</a>
              <a class="qy" id="13">3号线</a>
              <a class="qy" id="14">6号线</a>
              <a class="qy" id="15">国博线</a>
            </li>
            <li class="Switch">
              <strong>租金:</strong>
              <%
              strtemp = (String)s.getAttribute("class2");
           	  System.err.print("id" + strtemp);
              %>
              <a class="
              <%
              if(strtemp.equals("11"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="11" onclick="clickArea2(this.id, '0', '1000000000');">不限</a>
              <a class="
              <%
              if(strtemp.equals("12"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="12" onclick="clickArea2(this.id, '0', '999');">1000元以下</a>
              <a class="
              <%
              if(strtemp.equals("13"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="13" onclick="clickArea2(this.id, '1000', '1999');">1000-2000元</a>
              <a class="
              <%
              if(strtemp.equals("14"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="14" onclick="clickArea2(this.id, '2000','2999');">2000-3000元</a>
              <a class="
              <%
              if(strtemp.equals("15"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="15" onclick="clickArea2(this.id, '3000', '3999');">3000-4000元</a>
              <a class="
              <%
              if(strtemp.equals("16"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="16" onclick="clickArea2(this.id, '4000', '4999');">4000-5000元</a>
              <a class="
              <%
              if(strtemp.equals("17"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="17" onclick="clickArea2(this.id, '5000', '1000000000');">5000元及以上</a>
            </li>
            <li class="Switch">
              <strong>户型:</strong>
              <%
              strtemp = (String)s.getAttribute("class3");
           	  System.err.print("id" + strtemp);
              %>
              <a class="
              <%
              if(strtemp.equals("21"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="21" onclick="clickArea3(this.id, '0', '1000000000');">不限</a>
              <a class="
              <%
              if(strtemp.equals("23"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="23" onclick="clickArea3(this.id, '1', '1');">一室</a>
              <a class="
              <%
              if(strtemp.equals("24"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="24" onclick="clickArea3(this.id, '2', '2');">两室</a>
              <a class="
              <%
              if(strtemp.equals("25"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="25" onclick="clickArea3(this.id, '3', '3');">三室</a>
              <a class="
              <%
              if(strtemp.equals("26"))
            	  out.print("mt on");
              else
            	  out.print("qy");
              %>" id="26" onclick="clickArea3(this.id, '4', '1000000000');">四室及以上</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="list_tit">
        <div class="cenl fl">
        共找到
          <strong id="resultNum">
          <% 
            
      		List<RentHouse>list = (List<RentHouse>)s.getAttribute("list");
      		System.err.print(list.size());
      		out.print(list.size());
      	  %>
          </strong>
          <em>套符合您的要求</em>
        </div>
        <div class="cenr fr">
          <span>排序:</span>
          <a href="#" class="first active" tvalue="p1">默认</a>
          <a href="#" class="hovs" tvalue="p2">价格</a>
          <a href="#" class="hovx" tvalue="p3">价格</a>
        </div>
      </div>
      <ul class="mor_list">
      	<%
      	int st = (Integer)s.getAttribute("st");
      	int ed = Math.min(st + 5, list.size());
      	for(int iter = st; iter < ed; iter++) {
      		RentHouse i = list.get(iter);
      	%>
      	<li>
          <a href="#" class="data_link" target="_blank"></a>
          <div class="mor_img">
            <a href="#" target="_blank" onerror="this.src='#'" alt="沙坪坝区沙正街 电力小区 3房130平米3000元/月" title="沙坪坝区沙正街 电力小区 3房130平米3000元/月">
              <img src=${pageContext.request.contextPath}/jsp/images/rentWindow/38.jpg>
            </a>
          </div>
          <div class="mor_txt">
            <h3>
            	<%
            		out.print(i.getRentHouseAddress()+" ");
            		out.print(i.getRentHouseRoom()+"房");
            		out.print(i.getRentHouseArea()+"平米");
            		out.print(i.getRentHousePrice()+"元/月");
            	%>
            	<!--沙坪坝区沙正街 电力小区 3房130平米3000元/月-->
            </h3>
            <p class="dot">
            	<%
            		out.print(i.getCommunityId()+"小区|");
            		out.print(i.getRentHouseBuildTime()+"年建");
            	%>
              <!--  电力小区｜1997年建｜中装<br>
              		商圈：沙正街｜-->
              <em>
              	<%
              		out.print(i.getRentHouseFloorAttribute()+" ");
              	%>
              </em>
              /
              <abbr>
              	<%
              		out.print("共" + i.getRentHouseFloor()+ "层");
              	%>
              </abbr>
            </p>
            <p class="dor">
            <%
            	out.print(i.getRentHouseAddress());
            %>
            	<!--  沙坪坝区沙南街60号-->
            </p>
            <p>
              <a href="#" class="bq_cor_1">南北通透</a>
              <a href="#" class="bq_cor_2">品质小区</a>
              <a href="#" class="bq_cor_3">拎包入住</a>
            </p>
          </div>
          <div class="mor_tip mor_w">
            <p>
              <strong>
              <%
              out.print(i.getRentHousePrice());
              %>
              </strong>元/月
            </p>
            3室2厅
          </div>
        </li>
        <%}%>
      </ul>
      <div id="pagination" class="pagination simple-pagination">
        <div class="lightbox">
          <strong class="active">
             <a href=${pageContext.request.contextPath}/prePage.do style="border: 0px;">
            <span class="sel prev">上一页</span>
            </a>
          </strong>
          <strong class="active">
            <a href=${pageContext.request.contextPath}/nextPage.do style="border: 0px;">
            <span class="sel prev">下一页</span>
            </a>
          </strong>
        </div>
      </div>
    </div>


  </div>
</body>
</html>
