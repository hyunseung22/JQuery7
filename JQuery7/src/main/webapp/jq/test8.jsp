<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 반드시 라이브러리 추가 (CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("test8.jsp");
		
		// 비동기방식 ajax()사용해서 JSON데이터 타입정보 가져오기
		$.ajax({
			url:"json1.jsp",
			dataType:"json",
			success :function(data){
				alert("json1.jsp 페이지를 다녀옴");
				//alert(data);
				console.log(data);
				//$('body').append(data);
				$('body').append(data.name+"<hr>");
				$('body').append(data.age+"<hr>");
				$('body').append(data.gender+"<hr>");
				
			}
		});
		////////////////////////////////////////////////////////////
		// 		$.getJSON("주소",function(){
		// 			//성공시 처리 동작
		// 		});
		$.getJSON("json2.json",function(object){
			alert(" getJSON 사용 데이터 가져옴 ");
			// $('body').append(object.name);
			console.log(object); //{name: 'ITWILL', age: 30, gender: 'M'}
			$(object).each(function(key,value){
				 $('body').append(key+" : "+value+"<hr>");				
			});
			
		});
		
		// 비동기 방식으로 json3.json 데이터를 가져와서
		// resultDiv공간에 정보 출력
		
		$.getJSON("json3.json",function(data){
				alert(" json3.json 데이터 가져옴");
				console.log(data);
				//$(data).each();
				$.each(data,function(idx,item){
					//console.log(idx +"/"+item);
					//console.log(item);
					$('#resultDiv').append(item.name+"/"+item.gender+"/"+item.age+"<hr>");
					
					//$('table').append("<tr> <td>"+item.name+"</td><td>"+item.name+"</td> <td>"+item.age+"</td></tr>" );
			
				});
				
		});
				
		// 비동기방식으로 DB에 저장된 정보를 가져와서 표에 출력
		
		$.ajax({
			url : "list.jsp",
			success : function(data){
				alert(data);
				//$('body').append(data);
				// #dbMember 테이블에 요소 추가
			}
		
		})
		
		
		
		
	});
</script>
</head>
<body>
		<h1>test8.jsp</h1>
		
		<div id="resultDiv"></div>
		<table>
		<tr>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
		</tr>
		</table>
		
		<table border="1" id="dbMember">
		<tr>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
		</tr>
		
		</table>
</body>
</html>