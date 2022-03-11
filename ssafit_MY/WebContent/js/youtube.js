let xhr = new XMLHttpRequest();
xhr.onreadystatechange = responseVideo;
xhr.open("GET", "../video.json", true);
xhr.send(null)

function responseVideo() {
  //완벽하게 통신이 끝났을때
  if (xhr.readyState == 4) {
    //에러없이 응답이 성공적으로 처리가 되었을떄
    if (xhr.status == 200) {
      let videoHtml = "";
      let videoList = JSON.parse(xhr.response)
      //forEach
      videoList.forEach((video) => {
        videoHtml += `
        <div class="card m-2" style="width: 18rem;">
        <iframe
        width="100%"
        src="https://www.youtube.com/embed/${video.id}"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
        ></iframe>
        <div class="card-body">
        <button type="button" class="btn btn-primary btn-sm" disabled>${video.part}</button>
        <h5 class="card-title" style="height: 100px">${video.title}</h5>
        <br>
        <a href="https://www.youtube.com/embed/${video.id}" class="btn btn-primary">보러가기</a>
        <a href="#" class="btn btn-danger">삭제</a>
      </div>
        </div>`
      });


      document.querySelector("#video-area").innerHTML = videoHtml;
    }
  }
}

