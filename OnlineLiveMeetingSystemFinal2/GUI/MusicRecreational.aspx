<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="MusicRecreational.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.MusicRecreational" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            word-wrap:break-word;
        }
        video {
            object-fit: fill;
            width: 100%;
        }
        button,
        input,
        select {
            font-weight: normal;
            padding: 2px 4px;
            text-decoration: none;
            display: inline-block;
            text-shadow: none;
            font-size: 16px;
            outline: none;
        }

        .make-center {
            text-align: left;
            padding: 5px 10px;
        }

        img, input, textarea {
          max-width: 100%
        }

        @media all and (max-width: 500px) {
            .fork-left, .fork-right, .github-stargazers {
                display: none;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Demo version: 2017.08.06 -->
        <div class="github-stargazers"></div>

        <p style="float:left; text-align:left; line-height:2.232">
            You can stream your Mp4 or Mp3 files using WebRTC media ports. It is a realtime streaming!
            <br>
            The person who opens room, will select a Mp4 or Mp3 file. This demo will read your Mp4 or Mp3 file and generate a MediaStream object. The resulting MediaStream object will be shared with other users in realtime using WebRTC RTCPeerConnection API.
        </p>

        <section class="experiment">
            <div class="make-center">
                <input type="text" id="room-id" value="abcdef" autocorrect=off autocapitalize=off size=20>
                <button id="open-room">Open Room</button>
                <button id="join-room">Join Room</button>

                <div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
            </div>

            <div id="videos-container"></div>
        </section>

        <script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
        <script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>

        <script src="https://cdn.webrtc-experiment.com:443/FileBufferReader.js"></script>

        <!-- custom layout for HTML5 audio/video elements -->
        <script src="https://cdn.webrtc-experiment.com/getMediaElement.js"></script>

        <script>
            var connection = new RTCMultiConnection(); // to get window.DetectRTC object
            
            // ......................................................
            // .......................UI Code........................
            // ......................................................

            function oldBrowserDetected() {
                document.getElementById('open-room').disabled = true;
                document.getElementById('join-room').disabled = true;

                if(DetectRTC.browser.name == 'Chrome' && DetectRTC.browser.version >= 53) {
                    document.querySelector('blockquote').innerHTML = 'Please enable this flag: <a href="chrome://flags/#enable-experimental-web-platform-features">chrome://flags/#enable-experimental-web-platform-features</a>';
                } else {
                    document.querySelector('blockquote').innerHTML = 'Your browser does NOT supports pre-recorded media streaming.<br><br><span style="color:red;">This demo requires Chrome 53+ or Firefox (only on Mac).';
                }
            }

            if(DetectRTC.isVideoSupportsStreamCapturing !== true) {
                oldBrowserDetected();
            }

            document.getElementById('open-room').onclick = function() {
                disableInputButtons();

                var selector = new FileSelector();
                selector.accept = '*.mp4'; // webm or Mp4 or mp3 or wav or ogg
                selector.selectSingleFile(function(file) {
                    if(file.name.search(/.mp4|.mp3/g) === -1) {
                        document.getElementById('open-room').disabled = false;
                        document.getElementById('join-room').disabled = false;
                        document.getElementById('room-id').disabled = false;

                        alert('Please select either Mp4 or Mp3 file.');
                        return;
                    }

                    var video = document.createElement('video');
                    video.loop = true;
                    video.src = URL.createObjectURL(file);
                    video.play();

                    setTimeout(function() {
                        video.play();

                        try {
                            if('captureStream' in video) {
                                connection.preRecorededStream = video.captureStream();
                            }
                            else if('mozCaptureStream' in video) {
                                connection.preRecorededStream = video.mozCaptureStream();
                            }
                            else if('webkitCaptureStream' in video) {
                                connection.preRecorededStream = video.webkitCaptureStream();
                            }
                        }
                        catch(e) {
                            connection.preRecorededStream = null;
                        }

                        if(!connection.preRecorededStream) {
                            oldBrowserDetected();
                            return;
                        }

                        var stream = new MediaStream();
                        connection.preRecorededStream.getTracks().forEach(function(track) {
                            stream.addTrack(track);
                        });

                        // attach pre-recorded steam
                        connection.attachStreams.push(stream);
                        connection.onstream({
                            userid: connection.userid,
                            extra: connection.extra,
                            type: 'local',
                            stream: stream,
                            mediaElement: video
                        });

                        connection.open(document.getElementById('room-id').value, function() {
                            showRoomURL(connection.sessionid);
                        });
                    }, 2000);
                });
            };

            document.getElementById('join-room').onclick = function() {
                disableInputButtons();
                connection.join(document.getElementById('room-id').value);
            };

            // ......................................................
            // ..................RTCMultiConnection Code.............
            // ......................................................

            connection.dontCaptureUserMedia = true;

            // by default, socket.io server is assumed to be deployed on your own URL
            // connection.socketURL = '/';

            // comment-out below line if you do not have your own socket.io server
            connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

            connection.socketMessageEvent = 'pre-recorded-media-streaming-demo';

            connection.session = {
                audio: true,
                video: true,
                oneway: true
            };

            connection.sdpConstraints.mandatory = {
                OfferToReceiveAudio: true,
                OfferToReceiveVideo: true
            };

            connection.videosContainer = document.getElementById('videos-container');
            connection.onstream = function(event) {
                var width = parseInt(connection.videosContainer.clientWidth) - 20;
                var mediaElement = getMediaElement(event.mediaElement, {
                    title: event.userid,
                    buttons: ['full-screen'],
                    width: width,
                    showOnMouseEnter: false
                });

                connection.videosContainer.appendChild(mediaElement);

                setTimeout(function() {
                    mediaElement.media.play();
                    mediaElement.media.controls = true;
                }, 5000);

                mediaElement.id = event.streamid;
            };

            connection.onstreamended = function(event) {
                var mediaElement = document.getElementById(event.streamid);
                if(mediaElement) {
                    mediaElement.parentNode.removeChild(mediaElement);
                }
            };

            function disableInputButtons() {
                document.getElementById('open-room').disabled = true;
                document.getElementById('join-room').disabled = true;
                document.getElementById('room-id').disabled = true;
            }

            // ......................................................
            // ......................Handling Room-ID................
            // ......................................................

            function showRoomURL(roomid) {
                var roomHashURL = '#' + roomid;
                var roomQueryStringURL = '?roomid=' + roomid;

                var html = '<h2>Unique URL for your room:</h2><br>';

                html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
                html += '<br>';
                html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';

                var roomURLsDiv = document.getElementById('room-urls');
                roomURLsDiv.innerHTML = html;

                roomURLsDiv.style.display = 'block';
            }

            (function() {
                var params = {},
                    r = /([^&=]+)=?([^&]*)/g;

                function d(s) {
                    return decodeURIComponent(s.replace(/\+/g, ' '));
                }
                var match, search = window.location.search;
                while (match = r.exec(search.substring(1)))
                    params[d(match[1])] = d(match[2]);
                window.params = params;
            })();

            var roomid = '';
            if (localStorage.getItem(connection.socketMessageEvent)) {
                roomid = localStorage.getItem(connection.socketMessageEvent);
            } else {
                roomid = connection.token();
            }
            document.getElementById('room-id').value = roomid;
            document.getElementById('room-id').onkeyup = function() {
                localStorage.setItem(connection.socketMessageEvent, this.value);
            };

            var hashString = location.hash.replace('#', '');
            if(hashString.length && hashString.indexOf('comment-') == 0) {
              hashString = '';
            }

            var roomid = params.roomid;
            if(!roomid && hashString.length) {
                roomid = hashString;
            }

            if(roomid && roomid.length) {
                document.getElementById('room-id').value = roomid;
                localStorage.setItem(connection.socketMessageEvent, roomid);

                // auto-join-room
                (function reCheckRoomPresence() {
                    connection.checkPresence(roomid, function(isRoomExists) {
                        if(isRoomExists) {
                            connection.join(roomid);
                            return;
                        }

                        setTimeout(reCheckRoomPresence, 5000);
                    });
                })();

                disableInputButtons();
            }
        </script>   
</asp:Content>
