<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" %>



<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table id="table1" style="background-color:lightgrey;border:groove;height:100px;width:100%; overflow:hidden; display:compact"  runat="server" draggable="true">
        <tr>
            <td class="auto-style4" draggable="true">
                <asp:Button OnClick="Tab0_Click" ID="btnAssetDstbd" Text="Distribution" runat="server" Height="41px" Width="122px" />
                <asp:Button ID="btnAssetIntry" OnClick="Tab1_Click" Text="Inventory"  runat="server" Height="41px"  style="margin-left: 22px; margin-bottom: 1px" Width="122px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1" draggable="true">
                <asp:MultiView ID="multiVw1" runat="server">
                    <asp:View ID="view1" runat="server">
                        <table style="background-color: lightgray; align-content: center" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="lbl1" runat="server" Text="emp_ID  :" Font-Size="Medium"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txt1"  runat="server"  Height="30px" style="margin-left: 19px" Width="150px" MaxLength="10"></asp:TextBox>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnsearch" runat="server" Height="26px" OnClick="btnsearch_Click" style="margin-left: 0px; margin-top: 0px;" Text="search" Width="86px" />
                                    &nbsp;&nbsp;&nbsp;
                                   <%-- <asp:Button ID="btnAll" runat="server" Text="view all" OnClick="btnAll_Click"  />--%>
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" Visible="true" DataKeyNames="emp_id,asset" DataSourceID="SqlDataSource3"  style="margin-top: 26px"  CellPadding="4" ForeColor="#333333" GridLines="None"  CssClass="grdview">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                         
                                            <asp:BoundField DataField="emp_id" HeaderText="EmpId" ReadOnly="True" SortExpression="EmpID" />
                                            <asp:BoundField DataField="emp_name" HeaderText="Empname" ReadOnly="True" SortExpression="EmpName" />
                                            <asp:BoundField DataField="emp_username" HeaderText="Username" ReadOnly="True" SortExpression="EmpUsername" />
                                            <asp:BoundField DataField="asset" HeaderText="AssetName" ReadOnly="True" SortExpression="AssetName" />
                                            <asp:BoundField DataField="asset_id" HeaderText="AssetId" SortExpression="AssetID" />
                                            <asp:BoundField DataField="dop" HeaderText="DistributedDate" SortExpression="DistributedName" />
                                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="Status" />
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
                                    <asp:Label ID="Label1" runat="server" Visible="false" Font-Bold="true"  ></asp:Label>
                                    <br />
                                    <br />
                                   
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT * FROM [emp_asset]" FilterExpression="emp_id ='{0}'">
                       <FilterParameters>
                           <asp:ControlParameter ControlID="txt1" PropertyName="text" />
                       </FilterParameters>
                   </asp:SqlDataSource>
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="view2" runat="server">
                        <table style="background-color: lightgray; align-content: center" runat="server">
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="Label2" runat="server" Text="Asset Name    :"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="Txt2" runat="server" Height="33px"  style="margin-left: 29px" Width="148px" MaxLength="10" ></asp:TextBox>
                                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="Btnsearch2" runat="server" Height="31px" Text="Search" Width="97px" OnClick="linkbtn2_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <%--  <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">ViewAll</asp:LinkButton>--%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                    <br />
                                    <br />
                                      
                                    <asp:HiddenField  ID="hdassetid" runat="server"/>
                                    <asp:HiddenField  ID="hdassetname" runat="server"/>
                                        <script>

                                            function myFunction(p) {
                                                document.getElementById('<%= hdassetid.ClientID %>').value = p.parentNode.parentNode.children[1].innerHTML;
                                                document.getElementById('<%= hdassetname.ClientID %>').value = p.parentNode.parentNode.children[2].innerHTML;
                                                var x = document.getElementById("myDialog");
                                                x.showModal();
                                                x.focus();
                                                return false;

                                            }

                                            </script>
                                    <asp:GridView ID="GridView2" runat="server" visible="true"   style="margin-top: 0px"  CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grdview">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                             <asp:TemplateField HeaderText="">
                               <itemtemplate>
                                   <asp:button id="btnallocate" runat="server" visible="false"  forecolor="green" text="allocate" OnClientClick="return myFunction(this)" />
                                   <asp:button id="btndeallocate" runat="server" visible="false"  forecolor="red" text="deallocate"  />
                               </itemtemplate>
                           </asp:TemplateField>
                                     
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
                                  
                                        
                                    <asp:Label ID="Lbinven1" runat="server" Visible="false" Font-Bold="true"  Text="no results found!!!"></asp:Label>
                                     
                   
                                   <br />

                    
                   <asp:Label ID="LbSucess" runat="server" Text="Data Inserted Succesfully!!" Visible="false"></asp:Label>
                    
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                           <dialog id="myDialog" title="dialog" class="dialog" draggable="false">
                       
                              <asp:Label ID="label3" Text="enter the employee ID:" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                              <asp:TextBox ID="txtInsert" runat="server" MaxLength="10"></asp:TextBox>
                            <br />
                            <br />
                               <asp:Label ID="label4" Text="enter emp name:" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="TxtInsertName"  runat="server" TextMode="SingleLine" MaxLength="15"></asp:TextBox>
                                  <br />
                                  <br />
                                <asp:Label ID="label5" Text="enter the date:" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtInsertDate"  runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                            <br />
                             <asp:Button ID="btnInsert" Text="ok" Visible="true" runat="server" Font-Bold="True" OnClick="btnInsert_Click1" Font-Italic="True"  />
                
                                          </dialog>
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
            height: 1240px;
            width: 1097px;
        }

        .auto-style1 {
            width: 957px;
        }

        .auto-style2 {
            width: 611px;
        }

        .auto-style3 {
            width: 613px;
        }

        .auto-style4 {
            width: 957px;
            height: 53px;
        }

        dialog {
            background: #FFF;
            width: 450px;
            text-align: center;
            padding: 1.5em;
            margin: 1em auto;
            border: 0;
            border-top: 5px solid #00ccff;
            box-shadow: 0 2px 10px rgb(0, 204, 255);
            visibility: visible;
            float: none;
        }

            dialog::backdrop {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.8);
            }

        Initial {
            display: block;
            padding: 4px 12px 4px 12px;
            float: left;
            color: Black;
            font-weight: bold;
        }

        .Initial:hover {
            color: White;
        }

        .Clicked {
            position:  relative;
            float: left;
            display: block;
            padding: 6px 12px 6px 12px;
            color: Black;
            font-weight: bold;
            color: blue;
            
        }

        .grdview {
            position: relative;
            width: 180%;
            word-break: keep-all;
            word-wrap: break-word;
        }
       
    </style>

</asp:Content>
