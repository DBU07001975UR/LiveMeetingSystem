<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="JoinMeeting.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.JoinMeeting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%--<script>
        if(!location.hash.replace('#', '').length) {
            location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
            location.reload();
        }
    </script>--%>
    <style>
    audio,
    video {
        -moz-transition: all 1s ease;
        -ms-transition: all 1s ease;
        -o-transition: all 1s ease;
        -webkit-transition: all 1s ease;
        transition: all 1s ease;
        vertical-align: top;
    }

    
    #chat-output div,
    #file-progress div {
        border: 1px solid black;
        border-bottom: 0;
        padding: .1em .4em;
    }
    
    #chat-output,
    #file-progress {
        margin: 0 0 0 .4em;
        max-height: 12em;
        overflow: auto;
    }
    
    .data-box input {
        border: 1px solid black;
        font-family: inherit;
        font-size: 1em;
        margin: .1em .3em;
        outline: none;
        padding: .1em .2em;
        width: 97%;
    }
     .section-divider {
            display: inline-block;
            width: 45%;
            border: 2px outset black;
            padding: 5px 10px;
            vertical-align: top;
            height: 500px;
        }

            .section-divider * {
                padding: 0;
                margin: 0;
            }

            .section-divider h2 {
                font-size: 2em;
                border-bottom: 2px outset black;
                margin-bottom: 15px;
                margin-left: -10px;
                margin-right: -10px;
                padding: 0 10px;
                text-align: center;
            }

            .section-divider textarea {
                width: 90%;
                height: 250px;
                resize: none;
                font-size: 2em;
                padding: 5px 10px;
            }

        select {
            height: auto;
            vertical-align: middle;
            font-size: inherit;
        }

        button, input[type=button] {
            padding: 0 5px !important;
        }
        .auto-style1 {
            height: 237px;
        }
    </style>

    <!-- webrtc library used for streaming -->
    <script src="https://cdn.webrtc-experiment.com/socket.io.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/RTCMultiConnection.js"></script>
    <script src="https://cdn.webrtc-experiment.com/getMediaElement.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="github-stargazers"></div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- just copy this <section> and next script -->
        <section class="experiment">
            <div style="float: right;">
                <input type="checkbox" id="fakeDataChannels" style="width: auto;">
                <label for="fakeDataChannels" title="You can chat and share files using your preferred signaling gateway instead of using WebRTC data channels!">Setup Fake Data Connection?</label>
            </div>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server">Leave Out</asp:LinkButton>
        </div>
            <h2 class="header" id="feedback">
                Select SessionType and Direction-of-Flow!
            </h2>
                <section>Session:
                <select id="session" title="Session">
                    <option>audio+video+data+screen</option>
                    <option>audio+video+data</option>
                    <option>audio+data+screen</option>
                    <option>audio+video+screen</option>
                    <option selected>audio+video</option>
                    <option>audio+screen</option>
                    <option>video+screen</option>
                    <option>data+screen</option>
                    <option>audio+data</option>
                    <option>video+data</option>
                    <option>audio</option>
                    <option>video</option>
                    <option>data</option>
                    <option>screen</option>
                </select>&nbsp;Direction:
                <select id="direction" title="Direction">
                    <option>many-to-many</option>
                    <option>one-to-one</option>
                    <option>one-to-many</option>
                    <option>one-way</option>
                </select>&nbsp;&nbsp; Group Name:
                <input type="text" id="session-name">
                <button id="setup-new-session" class="setup">New Session</button>
            </section>

            <!-- list of all available broadcasting rooms -->
            <table style="width: 100%;" id="rooms-list"></table>

            <!-- local/remote videos container -->
            <div id="videos-container"></div>
        </section>

        <section class="experiment data-box">
            <h2 class="header" style="border-bottom: 0;">WebRTC DataChannel</h2>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <h2 style="display: block; font-size: 1em; text-align: center;">Text Chat</h2>

                        <div id="chat-output"></div>
                        <input type="text" id="chat-input" style="font-size: 1.2em;" placeholder="chat message" disabled>
                    </td>
                    <td style="background: white;">
                        <h2 style="display: block; font-size: 1em; text-align: center;">Share Files</h2>
                        <input type="file" id="file" disabled>

                        <div id="file-progress"></div>
                    </td>
                </tr>
            </table>
        </section>
    <section>
    <table>
        <tr>
                    <td>
                        
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <div>
                                        <asp:Button ID="GiveVote" runat="server" Text="Show Candidate List to Vote" OnClick="GiveVote_Click" />
                                        <asp:RadioButtonList ID="VotingRadioButton"
                                            runat="server"
                                            BorderStyle="Groove"
                                            BorderWidth="1px"
                                            RepeatColumns="1" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="UserId" OnSelectedIndexChanged="VotingRadioButton_SelectedIndexChanged" DataMember="DefaultView" Width="211px">
                                        </asp:RadioButtonList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT Voting.UserId, Voting.Sounds, [User].FirstName, [User].LastName, [User].Sex FROM Voting INNER JOIN [User] ON Voting.UserId = [User].UserId"></asp:SqlDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                Manage Turn Area
                                    <asp:RadioButtonList ID="ManageTurn" runat="server" Font-Size="Medium"
                                        OnSelectedIndexChanged="ManageTurn_SelectedIndexChanged" Width="224px"
                                        AutoPostBack="True" CssClass="auto-style12" Height="16px"
                                        BorderStyle="Groove"
                                        BorderWidth="1px"
                                        RepeatColumns="3">
                                        <asp:ListItem Text="<img src='VoteImages/hand_raising1.png' />Raising" Value="Create Turn"></asp:ListItem>
                                        <asp:ListItem Text="<img src='VoteImages/speaking.png' />Speaking" Value="In Speaking"></asp:ListItem>
                                        <asp:ListItem Text="<img src='VoteImages/confirm5.png' />Complete" Value="Confirm Completion"></asp:ListItem>
                                    </asp:RadioButtonList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <div>
                                    <asp:Button ID="viewcandidate" runat="server" Text="Show Candidate Result" CausesValidation="False" OnClick="viewcandidate_Click" Width="169px" />
                                </div>
                                <div>
                                        <asp:GridView ID="GridView1" Visible="false" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Vertical">
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />

                                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                                <asp:BoundField DataField="Sounds" HeaderText="Sounds" SortExpression="Sounds" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT Voting.UserId, Voting.Sounds, [User].FirstName, [User].LastName FROM Voting INNER JOIN [User] ON Voting.UserId = [User].UserId"></asp:SqlDataSource>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </td>
                </tr>
            </table>
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
            video: true
        };

        var roomsList = document.getElementById('rooms-list'),
            sessions = {};
        connection.onNewSession = function(session) {
            if (sessions[session.sessionid]) return;
            sessions[session.sessionid] = session;

            var tr = document.createElement('tr');
            tr.innerHTML = '<td><strong>' + session.extra['session-name'] + '</strong> is an active session.</td>' +
                '<td><button class="join">Join</button></td>';
            roomsList.insertBefore(tr, roomsList.firstChild);

            tr.querySelector('.join').setAttribute('data-sessionid', session.sessionid);
            tr.querySelector('.join').onclick = function() {
                this.disabled = true;

                session = sessions[this.getAttribute('data-sessionid')];
                if (!session) alert('No room to join.');

                connection.join(session);
            };
        };

        var videosContainer = document.getElementById('videos-container') || document.body;
        connection.onstream = function(e) {
            var buttons = ['mute-audio', 'mute-video', 'record-audio', 'record-video', 'full-screen', 'volume-slider', 'stop'];

            if (connection.session.audio && !connection.session.video) {
                buttons = ['mute-audio', 'full-screen', 'stop'];
            }

            var mediaElement = getMediaElement(e.mediaElement, {
                width: (videosContainer.clientWidth / 2) - 50,
                title: e.userid,
                buttons: buttons,
                onMuted: function(type) {
                    connection.streams[e.streamid].mute({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onUnMuted: function(type) {
                    connection.streams[e.streamid].unmute({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onRecordingStarted: function(type) {
                    // www.RTCMultiConnection.org/docs/startRecording/
                    connection.streams[e.streamid].startRecording({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onRecordingStopped: function(type) {
                    // www.RTCMultiConnection.org/docs/stopRecording/
                    connection.streams[e.streamid].stopRecording(function(blob) {
                        if (blob.audio) connection.saveToDisk(blob.audio);
                        else if (blob.video) connection.saveToDisk(blob.video);
                        else connection.saveToDisk(blob);
                    }, type);
                },
                onStopped: function() {
                    connection.peers[e.userid].drop();
                }
            });

            videosContainer.insertBefore(mediaElement, videosContainer.firstChild);

            if (e.type == 'local') {
                mediaElement.media.muted = true;
                mediaElement.media.volume = 0;
            }
        };

        connection.onstreamended = function(e) {
            if (e.mediaElement.parentNode && e.mediaElement.parentNode.parentNode && e.mediaElement.parentNode.parentNode.parentNode) {
                e.mediaElement.parentNode.parentNode.parentNode.removeChild(e.mediaElement.parentNode.parentNode);
            }
        };

        var setupNewSession = document.getElementById('setup-new-session');

        setupNewSession.onclick = function() {
            setupNewSession.disabled = true;

            var direction = document.getElementById('direction').value;
            var _session = document.getElementById('session').value;
            var splittedSession = _session.split('+');

            var session = {};
            for (var i = 0; i < splittedSession.length; i++) {
                session[splittedSession[i]] = true;
            }

            var maxParticipantsAllowed = 256;

            if (direction == 'one-to-one') maxParticipantsAllowed = 1;
            if (direction == 'one-to-many') session.broadcast = true;
            if (direction == 'one-way') session.oneway = true;

            var sessionName = document.getElementById('session-name').value;
            connection.extra = {
                'session-name': sessionName || 'Anonymous'
            };

            connection.session = session;
            connection.maxParticipantsAllowed = maxParticipantsAllowed;

            if (!!document.querySelector('#fakeDataChannels').checked) {
                // http://www.rtcmulticonnection.org/docs/fakeDataChannels/
                connection.fakeDataChannels = true;
            }

            connection.sessionid = sessionName || 'Anonymous';
            connection.open();
        };

        connection.onmessage = function(e) {
            appendDIV(e.data);

            console.debug(e.userid, 'posted', e.data);
            console.log('latency:', e.latency, 'ms');
        };

        connection.onclose = function(e) {
            appendDIV('Data connection is closed between you and ' + e.userid);
        };

        connection.onleave = function(e) {
            appendDIV(e.userid + ' left the session.');
        };

        // on data connection gets open
        connection.onopen = function() {
            if (document.getElementById('chat-input')) document.getElementById('chat-input').disabled = false;
            if (document.getElementById('file')) document.getElementById('file').disabled = false;
            if (document.getElementById('open-new-session')) document.getElementById('open-new-session').disabled = true;
        };

        var progressHelper = {};

        connection.autoSaveToDisk = false;

        connection.onFileProgress = function(chunk) {
            var helper = progressHelper[chunk.uuid];
            helper.progress.value = chunk.currentPosition || chunk.maxChunks || helper.progress.max;
            updateLabel(helper.progress, helper.label);
        };
        connection.onFileStart = function(file) {
            var div = document.createElement('div');
            div.title = file.name;
            div.innerHTML = '<label>0%</label> <progress></progress>';
            appendDIV(div, fileProgress);
            progressHelper[file.uuid] = {
                div: div,
                progress: div.querySelector('progress'),
                label: div.querySelector('label')
            };
            progressHelper[file.uuid].progress.max = file.maxChunks;
        };

        connection.onFileEnd = function(file) {
            progressHelper[file.uuid].div.innerHTML = '<a href="' + file.url + '" target="_blank" download="' + file.name + '">' + file.name + '</a>';
        };

        function updateLabel(progress, label) {
            if (progress.position == -1) return;
            var position = +progress.position.toFixed(2).split('.')[1] || 100;
            label.innerHTML = position + '%';
        }

        function appendDIV(div, parent) {
            if (typeof div === 'string') {
                var content = div;
                div = document.createElement('div');
                div.innerHTML = content;
            }

            if (!parent) chatOutput.insertBefore(div, chatOutput.firstChild);
            else fileProgress.insertBefore(div, fileProgress.firstChild);

            div.tabIndex = 0;
            div.focus();
        }

        document.getElementById('file').onchange = function() {
            connection.send(this.files[0]);
        };

        var chatOutput = document.getElementById('chat-output'),
            fileProgress = document.getElementById('file-progress');

        var chatInput = document.getElementById('chat-input');
        chatInput.onkeypress = function(e) {
            if (e.keyCode !== 13 || !this.value) return;
            appendDIV(this.value);

            // sending text message
            connection.send(this.value);

            this.value = '';
        };

        connection.connect();
        </script>
</asp:Content>
