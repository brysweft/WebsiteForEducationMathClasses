<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Management" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

void Page_Load() 
{
    MailEventNotificationInfo info = TemplatedMailWebEventProvider.CurrentNotification;
    Label0.Text = "EventsDiscardedByBuffer: " + info.EventsDiscardedByBuffer + '\n';
    Label1.Text = "EventsInBuffer: " + info.EventsInBuffer + '\n';
    Label2.Text = "NotificationSequence: " + info.NotificationSequence + '\n';
    Label3.Text = "NotificationType: " + info.NotificationType + '\n';
    Label4.Text = "EventsInNotification: " + info.EventsInNotification + '\n';
    Label5.Text = "EventsRemaining: " + info.EventsRemaining + '\n';
    Label6.Text = "MessagesInNotification: " + info.MessagesInNotification + '\n';
    Label7.Text = "eventsDiscardedDueToMessageLimit: " + info.EventsDiscardedDueToMessageLimit + '\n';
    Label8.Text = "messageSequence: " + info.MessageSequence + '\n';
    Label9.Text = "LastNotificationUtc: " + info.LastNotificationUtc.ToLocalTime().ToString() + '\n';

    EventList.DataSource = info.Events;
    EventList.DataBind();
    
}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <title>Ss</title>
</head>
<body>
  <form id="form1" runat="server">
<asp:Label runat="server" id="Label0" /><p />
<asp:Label runat="server" id="Label1" /><p />
<asp:Label runat="server" id="Label2" /><p />
<asp:Label runat="server" id="Label3" /><p />
<asp:Label runat="server" id="Label4" /><p />
<asp:Label runat="server" id="Label5" /><p />
<asp:Label runat="server" id="Label6" /><p />
<asp:Label runat="server" id="Label7" /><p />
<asp:Label runat="server" id="Label8" /><p />
<asp:Label runat="server" id="Label9" /><p />

<asp:DataList id="EventList" runat="server">
    <ItemTemplate>
      Event Received 
      Sequence: <%# DataBinder.Eval(Container.DataItem, "EventSequence") %><br>
      Details: <%# Container.DataItem.ToString() %>
    </ItemTemplate>
</asp:DataList>
  </form>
</body>
</html>