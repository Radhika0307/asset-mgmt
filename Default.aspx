<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp; <b style="align-content: center; font-family: Calibri; text-decoration: wavy; color: purple">Welcome to IT asset Management</b>
    </p>
    <center>
      <table  id="table1" style="background-color:lightgrey;border:groove;height:100px;width:500px; overflow:hidden; display:compact" runat="server">
         <tr>
             <td>
                 <asp:Button  OnClick="Tab1_Click" ID="btnAssetDstbd" Text="Distribution" runat="server" BorderStyle="None" Font-Bold="True" Font-Italic="True" />
                 <asp:Button ID="btnAssetIntry" OnClick="Tab2_Click" Text="Inventory"  runat="server" BorderStyle="None" Font-Bold="True" Font-Italic="True" />
             </td>
         </tr>
         <tr>
             <td>
                     <asp:MultiView ID="multiView1" runat="server" >
    <asp:View ID="view1" runat="server">
        <table style="background-color:lightgray;align-content:center" runat="server">
            <tr>
                <td class="auto-style1">       
                           
                     <asp:Label ID="lbDist" runat="server" Text="enter the employee ID:">
        </asp:Label>
        <asp:TextBox ID="txtDist" runat="server"></asp:TextBox>
                    <asp:Button ID="btnDist" runat="server" Text="search" OnClick="btnDist_Click"/>
                     <asp:LinkButton ID="LinkButton1" OnClick="btnDist_Click" runat="server">ViewAll</asp:LinkButton>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:GridView ID="gridView1" runat="server" AutoGenerateColumns="False" visible="False" DataSourceID="SqlDataSource1" ShowFooter="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="employee ID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("emp_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("emp_id") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lbInsert" runat="server" Text="Insert" ForeColor="Blue" ></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="asset">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("asset") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("asset") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:TextBox ID="txtAsset" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="asset type">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("asset_type") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("asset_type") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:TextBox ID="txtAssetType" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="distributed date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("dod") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("dod") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="status">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" FilterExpression="emp_id= '{0}'"
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [employee]"
                         DeleteCommand="DELETE FROM [employee] WHERE [emp_id] = @emp_id AND [asset] = @asset"
                         InsertCommand="INSERT INTO [employee] ([emp_id], [name], [emp_user_name], [asset], [asset_type], [dod], [status])
                         VALUES (@emp_id, @name, @emp_user_name, @asset, @asset_type, @dod, @status)" 
                         UpdateCommand="UPDATE [employee] SET [name] = @name, [emp_user_name] = @emp_user_name, [asset_type] = @asset_type, [dod] = @dod, [status] = @status WHERE [emp_id] = @emp_id AND [asset] = @asset">
                        <DeleteParameters>
                            <asp:Parameter Name="emp_id" Type="Int32" />
                            <asp:Parameter Name="asset" Type="String" />
                        </DeleteParameters>
                        <FilterParameters>
                            <asp:ControlParameter Name="emp_id" ControlID="txtDist" PropertyName="Text" />
                        </FilterParameters>
                        
                        <InsertParameters>
                            <asp:Parameter Name="emp_id" Type="Int32" />
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="emp_user_name" Type="String" />
                            <asp:Parameter Name="asset" Type="String" />
                            <asp:Parameter Name="asset_type" Type="String" />
                            <asp:Parameter DbType="Date" Name="dod" />
                            <asp:Parameter Name="status" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="emp_user_name" Type="String" />
                            <asp:Parameter Name="asset_type" Type="String" />
                            <asp:Parameter DbType="Date" Name="dod" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="emp_id" Type="Int32" />
                            <asp:Parameter Name="asset" Type="String" />
                        </UpdateParameters>
                        
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            </table>
    </asp:View>
        <asp:View ID="view2" runat="server">
        <table style="background-color:lightgray;align-content:center" runat="server">
            <tr>
                <td>       
        <asp:Label ID="Lbinven" runat="server" Text="asset Type:"> </asp:Label>
        <asp:TextBox ID="Txtinven" runat="server"></asp:TextBox>
        <asp:Button ID="btnInven" runat="server" Text="search" OnClick="btnInven_Click"  />
        <asp:LinkButton ID="LinkButton2" OnClick="btnInven_Click" runat="server">ViewAll</asp:LinkButton>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:GridView ID="gridView2" Visible="false" runat="server">

                    </asp:GridView>
                    <br />
                    <asp:Label ID="Lbinven1" runat="server" Visible="false" Font-Bold="true"  Text="no results found!!!"></asp:Label>
                </td>
            </tr>
            </table>
    </asp:View>
        </asp:MultiView>
                 </td>
             </tr>
         </table>
       </center>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #table1 {
            height: 411px;
            width: 482px;
        }

        .auto-style1 {
            height: 34px;
        }
    </style>
</asp:Content>
