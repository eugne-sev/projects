<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PsychicHistory.aspx.cs" Inherits="EdisonEmp.PsychicHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>История ответов</title>
</head>
<body> 
    <form id="form1" runat="server">
    <div style="font-family: verdana; font-size: small">
        <asp:Label runat="server" ID="lblName" Font-Bold="True" Font-Names="Tahoma"></asp:Label>
        <br />
        <br/>
        <asp:GridView runat="server" ID="gvPsychicHistory" CellPadding="4" 
            ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSourceHistory">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Value" HeaderText="Ответ" SortExpression="Value" />
                <asp:BoundField DataField="DateLog" HeaderText="Дата" 
                    SortExpression="DateLog" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSourceHistory" runat="server" 
            SelectMethod="PsychicAnswers" TypeName="EdisonEmp.PsychicData">
            <SelectParameters>
                <asp:QueryStringParameter Name="number" QueryStringField="NUM" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
