<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PsychicForm.aspx.cs" Inherits="EdisonEmp.PsychicForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <script language="javascript" type="text/javascript" >

        function OpenCenterScreen(url, width, height) {
            window.open(url, '', 'width=' + width + ',height=' + height + ',left=' + ((window.innerWidth - width) / 2) + ',top=' + ((window.innerHeight - height) / 2) + ', resizable=yes');
        }
    </script>
<head runat="server">
    <title></title>
</head>
<body>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <form id="form1" runat="server">
    <div style="font-family: verdana; font-size: small">
    <br/>
        <div id="divUserLog">
            <asp:GridView runat="server" ID="gvLogValues" CellPadding="4" 
                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSourceUserLog">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Value" HeaderText="Загадано" />
                    <asp:BoundField DataField="DateLog" HeaderText="Дата" 
                        DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" />
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
            <asp:ObjectDataSource ID="ObjectDataSourceUserLog" runat="server" 
                SelectMethod="UserLogItems" TypeName="EdisonEmp.LogData">
            </asp:ObjectDataSource>
        </div>
        <div id="divHeadMem" runat="server" Visible="True">
            <p>Загадайте двухзначное число</p>
            <asp:Button runat="server" ID="btnMake" Text="Загадал" onclick="btnMake_Click"/>
        </div>
        <div id="divHeadInp" runat="server" Visible="False">
            <p>Введите загаданное число</p>
            <asp:TextBox runat="server" ID="tbNumber" MaxLength="2"/>
            <asp:RequiredFieldValidator runat="server" ID="reqValidNumber" ControlToValidate="tbNumber" Display="Dynamic" ErrorMessage="*" ForeColor="Red"/>
            <asp:CompareValidator runat="server" ID="cmpValidNumber" ControlToValidate="tbNumber" Display="Dynamic" Operator="DataTypeCheck" Type="Integer" ErrorMessage="?" ForeColor="Red"/>
            <asp:CompareValidator runat="server" ID="cmpDigitValue" ControlToValidate="tbNumber" Display="Dynamic" Operator="GreaterThan" ValueToCompare="9" Type="Integer" ErrorMessage="?" ForeColor="Red"/>
            <asp:Button runat="server" ID="btnInput" Text="Ввод" onclick="btnInput_Click"/>
        </div>
        <div id="divGuess" runat="server" Visible="False">
        
        <div id="divLeftGrid">
                <asp:GridView runat="server" ID="gvPsychic" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSourceGuess" Height="380px" Width="340px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Number" HeaderText="№ п/п">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Псевдоним">
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Value" HeaderText="Значение">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
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
        </div>
        <div id="divRightGrid">
            <asp:GridView runat="server" ID="gvPsychicStatus" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="ObjectDataSourceStatus" ForeColor="#333333" 
                GridLines="None" Height="380px" Width="340px" 
                onrowcommand="gvPsychicStatus_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Number" HeaderText="№ п/п" SortExpression="Number">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <%-- 
                    <asp:BoundField DataField="Name" HeaderText="Псевдоним" SortExpression="Name">
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    --%>
                    <asp:TemplateField HeaderText="Псевдоним">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbName" CommandName='History' Text='<%# Eval("Name") %>' CommandArgument='<%# Eval("Number") %>'/>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Guessed" HeaderText="Угадано" SortExpression="Guessed">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
        </div>
        
    </div>
    <asp:ObjectDataSource ID="ObjectDataSourceGuess" runat="server" 
        SelectMethod="ShowResult" TypeName="EdisonEmp.PsychicData">
        <SelectParameters>
            <asp:SessionParameter Name="dataList" SessionField="PsychicClass" Type="Object"/>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceStatus" runat="server" 
        SelectMethod="BuilStatus" TypeName="EdisonEmp.PsychicData">
        <SelectParameters>
            <asp:SessionParameter Name="value" SessionField="InputValue" Type="Int32" />
            <asp:SessionParameter Name="dataList" SessionField="PsychicClass" Type="Object"/>
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
