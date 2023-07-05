window.onload = function() {
  insertAnswer(1);
};

function insertAnswer(value) {
  // AJAX를 통해 faq의 세부 정보를 가져옵니다.
  $.ajax({
    url: "jsonSelectAllFaq.do",
    data: {
      user_id: user_id,
      act_name: value
    },
    dataType: 'json',
    success: function(response) {
      console.log('ajax...success:', response);
      // 응답으로 받은 게시글 정보를 사용하여 게시글의 HTML을 생성합니다.
      let postHtml = `
        <div class="post">
          <h2>${response.title}</h2>
          <p>${response.content}</p>
          <div class="replies">
          </div>
          <div class="reply-form">
            <input type="text" id="replyInput" placeholder="댓글을 입력하세요...">
            <button onclick="addReply(${response.postId})">댓글 추가</button>
          </div>
        </div>
      `;
      $("#postContainer").html(postHtml);

      // 기존 댓글이 있다면 HTML을 생성하고 댓글 섹션에 삽입합니다.
      let repliesHtml = '';
      for (let i = 0; i < response.replies.length; i++) {
        let reply = response.replies[i];
        repliesHtml += `
          <div class="reply">
            <p>${reply.content}</p>
            <span class="author">${reply.author}</span>
          </div>
        `;
      }
      $(".replies").html(repliesHtml);
    },
    error: function(xhr, status, error) {
      console.log('xhr.status:', xhr.status);
    }
  });
}

function addReply(postId) {
  // 입력 필드에서 댓글 내용을 가져옵니다.
  const replyContent = $('#replyInput').val();

  // 댓글을 추가하기 위해 AJAX 요청을 보냅니다.
  $.ajax({
    url: "insertAnswerOK.do",
    data: {
      postId: postId,
      reply: replyContent
    },
    method: 'POST',
    dataType: 'json',
    success: function(response) {
      console.log('ajax...success:', response);

      // 응답으로 받은 신규 댓글 데이터를 사용하여 HTML을 생성하고 댓글 섹션에 추가합니다.
      let newReplyHtml = `
        <div class="reply">
          <p>${response.content}</p>
          <span class="author">${response.author}</span>
        </div>
      `;
      $(".replies").append(newReplyHtml);

      // 댓글 추가 후 입력 필드를 비워줍니다.
      $('#replyInput').val('');
    },
    error: function(xhr, status, error) {
      console.log('xhr.status:', xhr.status);
    }
  });
}
