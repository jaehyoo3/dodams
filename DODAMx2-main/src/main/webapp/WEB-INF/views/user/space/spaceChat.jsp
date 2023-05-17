<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>
<html>
	<head>
		<meta charset="uTF-8"> 
		<meta name ="viewport" content="width=device-width, initial-scaLe=1.0">
		<title></title>
		<link rel="stylesheet" href="/resources/css/user/spaceChat.css">
	</head>
	<body>
	<form autocomplete="off">
		<%@include file="../../include/user/spaceHeader.jsp"%>
        <!-- 멤버리스트 모달영역 -->
        <div class="container">
	<%@include file="../../include/user/spaceSideBar.jsp"%>
            <div class="chatMain">
                <section class="msger">
                    <main class="msger-chat" id="chatting">
                        <div id='bodyContent'>
                        </div>
                    </main>
                </section>
                <div class="chatarea">             
					<input type="text" class="msger-input" placeholder="메세지를 입력하세요" name="message" id="message" onkeydown="return limitLines(this, event)">
					<button id="submit" type="button" class="msger-send-btn">Send</button>
				</div>
            </div>
        </div>        
	</form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.12.1/firebase-app.js";
    import {
        getDatabase,
        set,
        ref,
        push,
        child,
        onValue,
        onChildAdded
    } from "https://www.gstatic.com/firebasejs/9.12.1/firebase-database.js";

 const firebaseConfig = {
    apiKey: "AIzaSyCL_g6qPtNzzzXL8Qt46Bv-vIvazeonOww",
    authDomain: "dodam-be38c.firebaseapp.com",
    databaseURL: "https://dodam-be38c-default-rtdb.firebaseio.com",
    projectId: "dodam-be38c",
    storageBucket: "dodam-be38c.appspot.com",
    messagingSenderId: "361188748813",
    appId: "1:361188748813:web:ee8064e38e9dbb7a54ef44"
  };

    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const database = getDatabase(app);

	var myName = '<c:out value="${sessName}"/>';
	var myID = '<c:out value="${sessId}"/>';
	var mySpace = '<c:out value="${img.zbspSeq}"/>';
	var memberPath = '<c:out value="${img.path}"/><c:out value="${img.uuidName}"/>';

    submit.addEventListener('click', (e) => {
        var message = document.getElementById('message').value;
        var name = myName;
		var space = mySpace;
		var timestemp = getTimeFormat(getnow());
		var memberpath = memberPath;

        const id = push(child(ref(database), 'messages')).key;
	    
        set(ref(database, 'messages/' + space + '/' + id), {
            name: name,
            message: message,
			timestemp: timestemp,
			memberpath: memberpath
        });

        document.getElementById('message').value = "";
		$("#chatting").scrollTop($("#chatting")[0].scrollHeight);
    });

    const newMsg = ref(database, 'messages/' + mySpace + '/');
    onChildAdded(newMsg, (data) => {
        if(data.val().name != myName) {
            var divData = '<div class="msg left-msg">\n' +
                '<div class="msg-img" style="background-image: url('+data.val().memberpath+')"></div>\n' +
                '<div class="msg-bubble">\n' +
				'<div class="msg-info">\n' +
				'<div class="msg-info-name">'+data.val().name+'</div>\n' +	
				'<div class="msg-info-time">'+data.val().timestemp+'</div>\n' +
				'</div>\n' +
				'<div class="msg-text">'+data.val().message+'</div>\n'
				'</div></div>';
            var d1 = document.getElementById('bodyContent');
            d1.insertAdjacentHTML('beforebegin', divData);

        } if(data.val().name == myName){
            var divData = '<div class="msg right-msg">\n' +
                '<div class="msg-img" style="background-image: url('+data.val().memberpath+')"></div>\n' +
                '<div class="msg-bubble">\n' +
				'<div class="msg-info">\n' +
				'<div class="msg-info-name">'+data.val().name+'</div>\n' +	
				'<div class="msg-info-time">'+data.val().timestemp+'</div>\n' +
				'</div>\n' +
				'<div class="msg-text">'+data.val().message+'</div>\n'
				'</div></div>';
            var d1 = document.getElementById('bodyContent');
            d1.insertAdjacentHTML('beforebegin', divData);

        }
    });
	function getTimeFormat(timetable) {
		return timetable.substring(6,8)+":"+timetable.substring(8,10);
	}
</script>
    
    <script type="text/javascript">  
   	$('.msger-add-btn').on('click',function(){
   	  $('.slide-menu').slideToggle();
   	  $('.dropdown-overlay').show();
   	});
   	$('.dropdown-overlay').on('click',function(){
   	  $('.slide-menu').hide();
   	  $(this).hide();
   	});

   	function limitLines(obj, e) {

		if (e.which === 13) {
			$("#submit").click();
			return false;
		}
	}
   	
	getnow = function() {
		var timestamp = new Date().getTime();
		
		var date = new Date(timestamp); //타임스탬프를 인자로 받아 Date 객체 생성
		
		var year = date.getFullYear().toString().slice(-2); //년도 뒤에 두자리
		var month = ("0" + (date.getMonth() + 1)).slice(-2); //월 2자리 (01, 02 ... 12)
		var day = ("0" + date.getDate()).slice(-2); //일 2자리 (01, 02 ... 31)
		var hour = ("0" + date.getHours()).slice(-2); //시 2자리 (00, 01 ... 23)
		var minute = ("0" + date.getMinutes()).slice(-2); //분 2자리 (00, 01 ... 59)
		var second = ("0" + date.getSeconds()).slice(-2); //초 2자리 (00, 01 ... 59)
		
		return year+month+day+hour+minute+second;
	};
	// 멤버리스트 모달
	 const listmodal = document.querySelector(".memberList-modal");
	 const listopenModalBtn = document.querySelector("#open-memberList-modal");
	 const listcloseModalBtn = document.querySelector("#close-memberList-modal");

	 listopenModalBtn.addEventListener("click", function () {
	 listmodal.style.display = "block";
	 });

	 listcloseModalBtn.addEventListener("click", function () {
	 listmodal.style.display = "none";
	 });
    </script>
</body>
</html>
