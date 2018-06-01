<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" EnableEventValidation="false" ValidateRequest="false" CodeBehind="ConductMeeting.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.ConductMeeting.ConductMeeting" %>

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

        p {
            padding: 1em;
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
    </style>
    <script>
        document.createElement('article');
        document.createElement('footer');
    </script>
    <!-- webrtc library used for streaming -->
    <script src="https://cdn.webrtc-experiment.com/socket.io.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/RTCMultiConnection.js"></script>
    <script src="https://cdn.webrtc-experiment.com/getMediaElement.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="divSpan">
        <span>Welcome to Meeting Room Page</span>
    </div>
    <div class="github-stargazers"></div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table style="width: 1000px;">
        <tr>
            <td><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">Leave Out</asp:LinkButton></td>
            <td><div style="float: right; font-family: Arial, Helvetica, sans-serif; font-size: 12pt" runat="server" id="up">
            Set Time Session:
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="30" Text="30 Minutes"></asp:ListItem>
                <asp:ListItem Value="25" Text="25 Minutes"></asp:ListItem>
                <asp:ListItem Value="20" Text="20 Minutes"></asp:ListItem>
                <asp:ListItem Value="15" Text="15 Minutes"></asp:ListItem>
                <asp:ListItem Value="10" Text="10 Minutes"></asp:ListItem>
                <asp:ListItem Value="5" Text="5 Minutes"></asp:ListItem>
                <asp:ListItem Value="2" Text="2 Minutes" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="1 Minutes"></asp:ListItem>
            </asp:DropDownList>
            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
            </asp:Timer>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Literal ID="litmsg" runat="server"></asp:Literal>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div></td>
            <td colspan="2">
             <div style="float: right;">
            <input type="checkbox" id="fakeDataChannels" style="width: auto;">
            <label for="fakeDataChannels" title="You can chat and share files using your preferred signaling gateway instead of using WebRTC data channels!">Setup Fake Data Connection?</label>
        </div>
            </td>
            
        </tr>
        <tr>
            <td colspan="4">
                <h2 class="header" id="feedback">Select SessionType and Direction-of-Flow!
        </h2>
            </td>
        </tr>
        <tr>
            <td>Select Session: <select id="session" title="Session">
                <option>audio+video+data+screen</option>
                <option selected>audio+video+data</option>
                <option>audio+data+screen</option>
                <option>audio+video+screen</option>
                <option>audio+video</option>
                <option>audio+screen</option>
                <option>video+screen</option>
                <option>data+screen</option>
                <option>audio+data</option>
                <option>video+data</option>
                <option>audio</option>
                <option>video</option>
                <option>data</option>
                <option>screen</option>
            </select></td>
            <td> Select Direction: <select id="direction" title="Direction">
                <option>many-to-many</option>
                <option>one-to-one</option>
                <option>one-to-many</option>
                <option>one-way</option>
            </select></td>
            <td>
                Enter Group Name: <input id="session-name" type="text" />
                </td>
            <td>
                <button id="setup-new-session" class="setup">
                    New Session
                </button>
            </td>
        </tr>

         <tr>
           <td colspan="4">
           <!-- list of all available broadcasting rooms -->
        <table style="width: 980px;" id="rooms-list"></table>
        <!-- local/remote videos container -->
        <div id="videos-container"></div></td>
        </tr>

         <tr>
            <td colspan="4">
          <section class="experiment data-box">
        <h2 class="header" style="border-bottom: 0;">WebRTC DataChannel</h2>
              <table style="width: 980px">
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
              </td>
        </tr>

         <tr>
            <td colspan="4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div id="minutesform" runat="server">
                    <table>
                        <tr>
                            <td class="auto-style11">
                                <asp:TextBox ID="txtMinutes" runat="server" Height="250pt" TextMode="MultiLine" Width="634pt" Font-Bold="False" Font-Italic="False" Font-Names="Arial Black" Font-Size="Medium"></asp:TextBox></td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Minutes is required." ControlToValidate="txtMinutes" CssClass="failureNotification"></asp:RequiredFieldValidator>
                            <td class="auto-style9">
                                <asp:Button ID="Submit" runat="server" Text="Submit" BackColor="#339933" Height="30px" Width="70px" OnClick="Submit_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <table>
                    <tr>
                        <td runat="server" id="voting" class="auto-style2">
                            <div>
                                <asp:Button ID="GiveVote" runat="server" Text="Show Candidate List to Vote" OnClick="GiveVote_Click" CausesValidation="False" />
                                <asp:RadioButtonList ID="VotingRadioButton" Visible="False"
                                    runat="server"
                                    BorderStyle="Groove"
                                    BorderWidth="1px"
                                    AutoPostBack="True" Width="211px" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="UserId" OnSelectedIndexChanged="VotingRadioButton_SelectedIndexChanged">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT Candidates.CandidateID, [User].FirstName, [User].LastName, [User].UserId FROM Candidates INNER JOIN [User] ON Candidates.UserID = [User].UserId AND Candidates.DeptCode = [User].DeptCode" InsertCommand="INSERT INTO Voting(UserID, VoterID, Sounds, CandidateID) VALUES (@UserID,@VoterID,@Sounds, @CandidateID)">
                                    <InsertParameters>
                                        <asp:Parameter Name="UserID" />
                                        <asp:Parameter Name="VoterID" />
                                        <asp:Parameter Name="Sounds" />
                                        <asp:Parameter Name="CandidateID" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </div>
                        </td>
                        <td runat="server" id="turnig">Manage Turn Area
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
                        </td>
                        <td runat="server" id="viewturn">
                            <asp:Button ID="ViewRise" runat="server" Text="View Create Turn Users" OnClick="ViewRise_Click" CausesValidation="False" />
                            <asp:RadioButtonList ID="RadioButtonList1" Visible="false" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="UserId" BorderStyle="Groove"
                                BorderWidth="2px"
                                Style="font-size: 11pt;"
                                RepeatColumns="1" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            </asp:RadioButtonList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT UserAccount.UserName, UserAccount.UserId, Turn.Status, Turn.Date, [User].FirstName, [User].LastName FROM Turn INNER JOIN UserAccount ON Turn.UserId = UserAccount.UserId AND Turn.Status = 'Create Turn' INNER JOIN [User] ON Turn.UserId = [User].UserId ORDER BY Turn.Date"></asp:SqlDataSource>
                        </td>
                        <td>
                            <div>
                                <asp:Button ID="viewcandidate" runat="server" Text="Show Candidate Result" CausesValidation="False" OnClick="viewcandidate_Click" />
                            </div>
                            <div>
                                <asp:GridView ID="GridView1" Visible="False" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />

                                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                                        <asp:BoundField DataField="Sounds" HeaderText="Sounds" ReadOnly="True" SortExpression="Sounds" />
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
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT DISTINCT CandidateResult.UserID, [User].FirstName, [User].LastName, [User].Sex, COUNT(CandidateResult.Sounds) AS Sounds FROM [User] INNER JOIN CandidateResult ON [User].UserId = CandidateResult.UserID GROUP BY CandidateResult.UserID, [User].FirstName, [User].LastName, [User].Sex, CandidateResult.Sounds"></asp:SqlDataSource>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div>
                                <asp:GridView ID="test" runat="server" Width="450px" Visible="false">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Decisisons
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:RadioButtonList ID="Radio1" runat="server">
                                                    <asp:ListItem Value="1" Text="Agree" />
                                                    <asp:ListItem Value="0" Text="Disagree" />
                                                </asp:RadioButtonList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="SubmitDecision" runat="server" Text="Submit Vote" OnClick="SubmitDecision_Click" Visible="false" />
                            </div>
                        </td>
                        <td colspan="2">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="AgreedTotal" HeaderText="AgreedTotal" ReadOnly="True" SortExpression="AgreedTotal" />
                                    <asp:BoundField DataField="IssueID" HeaderText="IssueID" SortExpression="IssueID" />
                                    <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                                    <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT COUNT(DISTINCT IssueResult.Result) AS AgreedTotal, IssueResult.IssueID, Faculty.FacultyName, Department.DeptName FROM IssueResult INNER JOIN Faculty ON IssueResult.FacultyCode = Faculty.FacultyCode INNER JOIN Department ON IssueResult.DeptCode = Department.DeptCode AND Faculty.FacultyCode = Department.DeptFacultyCode GROUP BY IssueResult.IssueID, Faculty.FacultyName, Department.DeptName"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table>
        <tr runat="server" id="close">
            <td colspan="4" style="text-align: center;">
                <asp:Button ID="CloseMeeting" runat="server" Text="Close Todays Meeting" CausesValidation="False" OnClick="CloseMeeting_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
            </td>
        </tr>

        
    </table>
     <script>
        var connection = new RTCMultiConnection();
        // https://github.com/muaz-khan/WebRTC-Experiment/tree/master/socketio-over-nodejs
        var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';
        //var SIGNALING_SERVER = 'http://localhost:6588';
        connection.openSignalingChannel = function (config) {
            var channel = config.channel || connection.channel || 'default-namespace';
            var sender = Math.round(Math.random() * 9999999999) + 9999999999;
            io.connect(SIGNALING_SERVER).emit('new-channel', {
                channel: channel,
                sender: sender
            });
            var socket = io.connect(SIGNALING_SERVER + channel);
            socket.channel = channel;

            socket.on('connect', function () {
                if (config.callback) config.callback(socket);
            });

            socket.send = function (message) {
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
        connection.onNewSession = function (session) {
            if (sessions[session.sessionid]) return;
            sessions[session.sessionid] = session;

            var tr = document.createElement('tr');
            tr.innerHTML = '<td><strong>' + session.extra['session-name'] + '</strong> is an active session.</td>' +
                '<td><button class="join">Join</button></td>';
            roomsList.insertBefore(tr, roomsList.firstChild);

            tr.querySelector('.join').setAttribute('data-sessionid', session.sessionid);
            tr.querySelector('.join').onclick = function () {
                this.disabled = true;

                session = sessions[this.getAttribute('data-sessionid')];
                if (!session) alert('No room to join.');

                connection.join(session);
            };
        };

        var videosContainer = document.getElementById('videos-container') || document.body;
        connection.onstream = function (e) {
            var buttons = ['mute-audio', 'mute-video', 'record-audio', 'record-video', 'full-screen', 'volume-slider', 'stop'];

            if (connection.session.audio && !connection.session.video) {
                buttons = ['mute-audio', 'full-screen', 'stop'];
            }

            var mediaElement = getMediaElement(e.mediaElement, {
                width: (videosContainer.clientWidth / 2) - 50,
                title: e.userid,
                buttons: buttons,
                onMuted: function (type) {
                    connection.streams[e.streamid].mute({
                        audio: type == 'audio',
                        video: type == 'video'

                    });
                },
                onUnMuted: function (type) {
                    connection.streams[e.streamid].unmute({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onRecordingStarted: function (type) {
                    // www.RTCMultiConnection.org/docs/startRecording/
                    connection.streams[e.streamid].startRecording({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onRecordingStopped: function (type) {
                    // www.RTCMultiConnection.org/docs/stopRecording/
                    connection.streams[e.streamid].stopRecording(function (blob) {
                        if (blob.audio) connection.saveToDisk(blob.audio);
                        else if (blob.video) connection.saveToDisk(blob.video);
                        else connection.saveToDisk(blob);
                    }, type);
                },
                onStopped: function () {
                    connection.peers[e.userid].drop();
                }
            });

            videosContainer.insertBefore(mediaElement, videosContainer.firstChild);

            if (e.type == 'local') {
                mediaElement.media.muted = true;
                mediaElement.media.volume = 0;
            }
        };

        connection.onstreamended = function (e) {
            if (e.mediaElement.parentNode && e.mediaElement.parentNode.parentNode && e.mediaElement.parentNode.parentNode.parentNode) {
                e.mediaElement.parentNode.parentNode.parentNode.removeChild(e.mediaElement.parentNode.parentNode);
            }
        };

        var setupNewSession = document.getElementById('setup-new-session');

        setupNewSession.onclick = function () {
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

        connection.onmessage = function (e) {
            appendDIV(e.data);

            console.debug(e.userid, 'posted', e.data);
            console.log('latency:', e.latency, 'ms');
        };

        connection.onclose = function (e) {
            appendDIV('Data connection is closed between you and ' + e.userid);
        };

        connection.onleave = function (e) {
            appendDIV(e.userid + ' left the session.');
        };

        // on data connection gets open
        connection.onopen = function () {
            if (document.getElementById('chat-input')) document.getElementById('chat-input').disabled = false;
            if (document.getElementById('file')) document.getElementById('file').disabled = false;
            if (document.getElementById('open-new-session')) document.getElementById('open-new-session').disabled = true;
        };

        var progressHelper = {};

        connection.autoSaveToDisk = false;

        connection.onFileProgress = function (chunk) {
            var helper = progressHelper[chunk.uuid];
            helper.progress.value = chunk.currentPosition || chunk.maxChunks || helper.progress.max;
            updateLabel(helper.progress, helper.label);
        };
        connection.onFileStart = function (file) {
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

        connection.onFileEnd = function (file) {
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

        document.getElementById('file').onchange = function () {
            connection.send(this.files[0]);
        };
        var chatOutput = document.getElementById('chat-output'),
            fileProgress = document.getElementById('file-progress');

        var chatInput = document.getElementById('chat-input');
        chatInput.onkeypress = function (e) {
            if (e.keyCode !== 13 || !this.value) return;
            appendDIV(this.value);
            // sending text message
            connection.send(this.value);

            this.value = '';
        };
        connection.connect();
    </script>
</asp:Content>

