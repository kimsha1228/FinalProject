window.onload = function() {
  $.ajax({
    url: "jsonSelectAllContact.do",
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
              <a href="selectOneContact.do?id=${vo.id}">${vo.id}</a>
            </td>
            <td>${vo.id}</td>
            <td>${vo.title}</td>
            <td>${vo.content}</td>
            <td>${vo.con_date}</td> 				
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
