<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="Mp3Recreational.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.Mp3Recreational" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--<script>
        if(!location.hash.replace('#', '').length) {
            location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
            location.reload();
        }
    </script>--%>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <script>
        document.createElement('article');
        document.createElement('footer');
    </script>
     <script src="https://cdn.webrtc-experiment.com/socket.io.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/RTCMultiConnection.js"></script>
    <style>
        .search-container {
            text-align: left;
            margin: -2em 5%;
            margin-top: 0;
        }
        .search-container input {
            background-color: transparent;
        }
        
        .search-container td {
            border: 0;
            vertical-align: top;
            padding: 0;
            border-top: none;
            border-right: none;
        }
        
        summary::-webkit-details-marker {
          display: none
        }
        summary {
            outline:none;
        }
        summary:after {
            background: rgb(219, 215, 215);
            border-radius: 1px;
            content: "+";
            color: #838080;
            float: left;
            font-size: 1.5em;
            font-weight: bold;
            margin: 0 10px 0 -10px;
            padding: 0;
            text-align: center;
            width: 20px;
            cursor: pointer;
            border: 1px solid rgb(189, 189, 189);
            border-left: 0;
        }
        details[open] summary:after {
          content: "-";
        }
        details blockquote.inline {
            margin-left: 23px;
        }
        
        .libraries {
            margin-left: 0;
        }
        
        .libraries li {
            list-style: none;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="github-stargazers"></div>
        
        <section class="experiment">
            <h2 class="header">
                Share mp3 Live using RTCMultiConnection
            </h2>
            <table style="width: 650px;">
                <tr>
                    <td> <input type="file"></td>
                    <td><button id="openNewSessionButton" disabled>Open New Room</button></td>
                    </tr>
                <tr>
                    <td colspan="2"><div id="streams-container"></div></td>
                </tr>
            </table>
            <br>
        </section>
    <script>
        var connection = new RTCMultiConnection();
        // https://github.com/muaz-khan/WebRTC-Experiment/tree/master/socketio-over-nodejs
        var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';
        connection.openSignalingChannel = function(config) {
            var channel = config.channel || connection.channel || 'default-namespace';
            var sender = Math.round(Math.random() * 9999999999) + 9999999999;
            io.connect(SIGNALING_SERVER).emit('new-channel', {
                channel: channel,
                sender: sender
            });
            var socket = io.connect(SIGNALING_SERVER + channel);
            socket.channel = channel;
            socket.on('connect', function() {
                if (config.callback) config.callback(socket);
            });
            socket.send = function(message) {
                socket.emit('message', {
                    sender: sender,
                    data: message
                });
            };
            socket.on('message', config.onmessage);
        };
        
        connection.session = {
            audio: true,
            oneway: true
        };
        var streamsContainer = document.getElementById('streams-container');
        connection.onstream = function(e) {
            streamsContainer.appendChild(e.mediaElement);
        };
        // connect to signaling gateway
        connection.connect();
        // open new session
        document.getElementById('openNewSessionButton').onclick = function() {
            this.disabled = true;
            connection.open();
        };
        window.AudioContext = window.AudioContext || window.webkitAudioContext;
        var context = new AudioContext();
        var gainNode = context.createGain();
        gainNode.connect(context.destination);
        // don't play for self
        gainNode.gain.value = 0;
        document.querySelector('input[type=file]').onchange = function() {
            this.disabled = true;
            var reader = new FileReader();
            reader.onload = (function(e) {
                // Import callback function that provides PCM audio data decoded as an audio buffer
                context.decodeAudioData(e.target.result, function(buffer) {
                    // Create the sound source
                    var soundSource = context.createBufferSource();
                    soundSource.buffer = buffer;
                    soundSource.start(0, 0 / 1000);
                    soundSource.connect(gainNode);
                    var destination = context.createMediaStreamDestination();
                    soundSource.connect(destination);
                    connection.attachStreams.push(destination.stream);
                    connection.dontCaptureUserMedia = true;
                    document.getElementById('openNewSessionButton').disabled = false;
                });
            });
            reader.readAsArrayBuffer(this.files[0]);
        };
        </script>
        <style>
        input,
        button[disabled] {
            background: none;
            border: 1px solid rgb(226, 223, 223);
        }
        </style>
</asp:Content>
