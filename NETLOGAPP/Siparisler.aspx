<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Siparisler.aspx.cs" Inherits="NETLOGAPP.Siparisler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="dist/BootStrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="dist/BootStrap/css/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="dist/BootStrap/js/bootstrap-multiselect.min.js"></script>
    <script src="dist/BootStrap/js/bootstrap.min.js"></script>


    <script type="text/javascript">
        window.alert = function (txt, title) {

            var a = [];
            a = txt;
            this.console.log(txt);
            Notiflix.Notify.Failure(txt, { timeout: 4000 });
        }

        $(function () {
            $('[id*=lsOrders]').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
                filterPlaceholder: 'Search',
                enableCaseInsensitiveFiltering: true,
                dropRight: true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row m-2">
            <div class="col-lg-1 col-2">
                <button type="button" class="btn btn-outline-primary btn-sm" style="height: 35px; width: 80px; font-weight: bold; padding-right: -1px" data-toggle="modal" id="2" data-target="#PopupUrunSave">
                    Yeni
                </button>
            </div>
        </div>

        <!-- Modal Urun-->


        <!--Modal sipariş Save  Start-->
        <div class="modal fade" id="PopupUrunSave" tabindex="-1" role="dialog" aria-labelledby="UrunSave" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Sipariş Kayit 
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row m-1">
                            <label for="ddlCustomer" class="col-6 p-2 text-primary text-right">Müşteri</label>
                            <div class="col-6">
                                <asp:DropDownList ID="ddlCustomer" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfddlCustomer" runat="server" ValidationGroup="btnSave" ErrorMessage="Müşteri boş geçilemez" ForeColor="Red" ControlToValidate="ddlCustomer" Display="None"></asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="row m-1">
                            <label for="txtOrderDate" class="col-6 p-2 text-primary text-right">Ürün Adı</label>
                            <div class="col-6 mt-1">
                                <asp:TextBox ID="txtOrderDate" TextMode="DateTimeLocal" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxtOrderDate" runat="server" ValidationGroup="btnSave" ErrorMessage="Tarih boş geçilemez" ForeColor="Red" ControlToValidate="txtOrderDate" Display="None"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row m-1">
                            <label for="txtFicheNo" class="col-6 p-2 text-primary text-right">Fiş No</label>
                            <div class="col-6 mt-1">
                                <asp:TextBox ID="txtFicheNo" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxtFicheNo" runat="server" ValidationGroup="btnSave" ErrorMessage="Fiş no boş geçilemez" ForeColor="Red" ControlToValidate="txtFicheNo" Display="None"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row m-1">
                            <label for="lsOrder" class="col-6 p-2 text-primary text-right">Ürünler</label>
                            <div class="col-6 mt-1">
                                <asp:ListBox ID="lsOrders" SelectionMode="Multiple" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="sdads" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="sdads" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="sdads" Value="3"></asp:ListItem>
                                </asp:ListBox>
                                <asp:RequiredFieldValidator ID="rflsOrder" runat="server" ValidationGroup="btnSave" ErrorMessage="Ürünler geçilemez" ForeColor="Red" ControlToValidate="lsOrders" Display="None"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="vdSummary" runat="server" ValidationGroup="btnSave" ShowMessageBox="true" ShowSummary="false" />
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-outline-success" ValidationGroup="btnSave" Text="Oluştur" OnClick="btnSave_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
