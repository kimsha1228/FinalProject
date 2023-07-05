window.onload = function() {
  $.ajax({
    url: "jsonSelectAllAnswer.do",
    type: "GET",
    dataType: "json",
    success: function(data) {
      console.log('ajax.....{}', data);

      let tag_vos = '';
      for (var i = 0; i < data.length; i++) {
        let vo = data[i];
        tag_vos += `
          <tr>
            <td>				
              <a href="selectOneAnswer.do?id=${vo.id}">${vo.id}</a>
            </td>
            <td>${vo.num}</td>
            <td>${vo.content}</td>
            <td>${vo.ans_date}</td>
            <td>${vo.seller_id}</td>
            <td>${vo.contact_id}</td> 				
          </tr>
        `;
      }

      $("#vos").html(tag_vos);
    },
    error: function(xhr, status, error) {
      console.error("AJAX Error: " + status + ", " + error);
    }
  });
};
