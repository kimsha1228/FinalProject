window.onload = function() {
  $.ajax({
    url: "/jsonSelectAllanswer.do",
    type: "GET",
    dataType: "json",
    success: function(data) {
      // AJAX 요청이 성공한 경우 처리할 로직
      console.log(data); // 반환된 데이터 콘솔에 출력

      // 반환된 데이터를 표시할 HTML 요소 선택
      var resultDiv = $("#result");

      // 데이터를 순회하며 표시할 내용 생성
      var html = "";
      for (var i = 0; i < data.length; i++) {
        var answer = data[i];
        html += "<p>ID: " + answer.num + ", Content: " + answer.content + "</p>";
      }

      // 결과를 HTML에 삽입
      resultDiv.html(html);
    },
    error: function(xhr, status, error) {
      // AJAX 요청이 실패한 경우 처리할 로직
      console.error("AJAX Error: " + status + ", " + error);
    }
  });
};
