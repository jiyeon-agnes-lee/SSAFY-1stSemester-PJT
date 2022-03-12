
let xhr2 = new XMLHttpRequest();
xhr2.onreadystatechange = responseVideo;
xhr2.open("GET", "../video_main2.json", true);
xhr2.send(null)

function responseVideo() {
  //완벽하게 통신이 끝났을때
  if (xhr2.readyState == 4) {
    //에러없이 응답이 성공적으로 처리가 되었을떄
    if (xhr2.status == 200) {
      let videoHtml = "";
      let videoList = JSON.parse(xhr2.response)
      videoList.forEach((video) => {
        videoHtml += `
        <div class="card shadow-sm m-2" style="width: 18rem;">
        <iframe
        width="100%"
        src="https://www.youtube.com/embed/${video.id}"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
        ></iframe>
        <div class="card-body">
        
        <p class="card-text" style="height: 55px">${video.title}</p>
        <div class="d-flex justify-content-between align-items-center">
        <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
        <div class="d-flex flex-row">
        <span class="badge bg-success">${video.part}</span>
        <span class="badge bg-danger ">${video.channelName}</span>
                            </div>
                          </div>
        
      </div>
        </div>`
      });


      document.querySelector("#video-area2").innerHTML = videoHtml;
    }
  }
}