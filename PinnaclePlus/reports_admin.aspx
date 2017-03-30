<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PinnaclePlus_master.Master" CodeBehind="reports_admin.aspx.vb" Inherits=".reports_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/data_pages.css" rel="stylesheet" type="text/css" />
    <style>
     .GvGrid:hover
        {
            background-color: #FFEB9C;
            color:#9C6500;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="top_cap">
        <asp:Literal ID="litCap" runat="server"></asp:Literal>
    </div>
    <div class="error">
        <asp:Literal ID="litError" runat="server" Visible="false" ></asp:Literal>
    </div>
    
    <asp:Panel ID="pnlData" runat="server" Visible="true">
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
            <asp:LinkButton ID="lbAddNew" runat="server">Add New</asp:LinkButton></div>
        <br />
        <div style="margin-left:auto;margin-right:auto;width:80%">
        <asp:GridView id="gvData" runat="server" CssClass="AppLabel" Width="100%" AutoGenerateColumns="False" DataKeyNames="REP_ID" RowStyle-CssClass="GvGrid" >
            <RowStyle />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>   
                <asp:BoundField DataField="Description"  HeaderText="Description" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Left" CssClass="WrappedColumnText"></ItemStyle>
                </asp:BoundField>
                <asp:ButtonField CommandName="CmdEdit" ButtonType="Link" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Edit" Text="Edit"  />
                <asp:ButtonField CommandName="CmdCopy" ButtonType="Link" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Copy" Text="Copy"  />
                <asp:ButtonField CommandName="CmdDel" ButtonType="Link" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" Text="Delete"  />
            </Columns>
        </asp:GridView>
            </div>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server" Visible="false">
        <div>
            <table style="margin-left: auto; margin-right: auto;">
                <tr>
                    <td>Name: </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="1000"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Description: </td>
                    <td>
                        <asp:TextBox ID="txtDes" runat="server" Width="1000"></asp:TextBox></td>
                </tr>
                <tr>
                    <td> <asp:CheckBox ID="chkIsPP" runat="server" Text="Is Pinnacle Plus" /></td>
                    
                </tr>
                <tr>
                    <td>Query </td>
                    <td>
                        <asp:TextBox ID="txtQuery" runat="server" Width="1000" TextMode="MultiLine" Rows="40"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td  >

                        <asp:GridView ID="gvPara" runat="server" CssClass="AppLabel"  AutoGenerateColumns="False" DataKeyNames="RP_ID" >
                            <RowStyle />
                            <Columns>
                                <asp:TemplateField HeaderText="S#">
                                    <HeaderStyle HorizontalAlign="Center" Width="10px" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%# CType(Container, GridViewRow).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" >
                                    <HeaderStyle HorizontalAlign="Center"  Width="110px"/>
                                    <ItemStyle HorizontalAlign="Left" Width="110px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtParaName" runat="server" Width="110px" Text='<%# Bind("Name")%>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" >
                                    <HeaderStyle HorizontalAlign="Center"  Width="200px"/>
                                    <ItemStyle HorizontalAlign="Left" Width="200px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtParaDescription" runat="server"  Width="200px" Text='<%# Bind("Description")%>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type" >
                                    <HeaderStyle HorizontalAlign="Center"  Width="110px"/>
                                    <ItemStyle HorizontalAlign="Left" Width="110px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlParaType" runat="server"  Width="110px">
                                            <asp:ListItem Text="GeneralText" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="OrderNo" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="OrderNo_Outer" Value="21"></asp:ListItem>
                                            <asp:ListItem Text="TrackingNo" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="TrackingNo_Outer" Value="31"></asp:ListItem>
                                            <asp:ListItem Text="Date_" Value="40"></asp:ListItem>
                                            <asp:ListItem Text="ClientList" Value="50"></asp:ListItem>
                                            <asp:ListItem Text="CheckBox" Value="60"></asp:ListItem>
                                            <asp:ListItem Text="Hub_List" Value="70"></asp:ListItem>
                                            <asp:ListItem Text="State_List" Value="80"></asp:ListItem>
                                            <asp:ListItem Text="Cur_User" Value="90"></asp:ListItem>
                                            <asp:ListItem Text="File" Value="100"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Width"  >
                                    <HeaderStyle HorizontalAlign="Center" Width="40px"/>
                                    <ItemStyle HorizontalAlign="Left"  Width="40px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtParaWidth" runat="server"  Width="40px" Text='<%# Bind("Width")%>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rows">
                                    <HeaderStyle HorizontalAlign="Center"  Width="40px"/>
                                    <ItemStyle HorizontalAlign="Left" Width="40px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtParaRows" runat="server" Width="40px" Text='<%# Bind("Rows_")%>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField CommandName="CmdDel" ButtonType="Link" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" Text="Delete" />
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btnAddPara" runat="server" Text="Add Parameter" />
                    </td>
                </tr>
                <tr>
                    <td>Users</td>
                    <td>
                        <asp:CheckBoxList ID="lstUsers" runat="server" ></asp:CheckBoxList>

                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" />&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" />
        </div>
    </asp:Panel>
    <asp:HiddenField ID="REP_ID" runat="server" />
</asp:Content>
