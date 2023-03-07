pageextension 33000892 "Purchase Order Ext B2B" extends "Purchase Order"
{

    layout
    {
        addafter("Assigned User ID")
        {
            field("Dimension Set ID B2B"; Rec."Dimension Set ID")
            {
                ApplicationArea = All;
                Tooltip = 'The dimension set is identified by a dimension set ID. It is Assigned to each Dimension set. A dimension set is a unique combination of dimension values. ';
            }
        }
        addafter(Control71)
        {
            field("Receiving No. Series B2B"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;
                Tooltip = 'Receiving Number Series in an Unique Number series, Setups in Purchase & Payable Setup. This Number Series used in Purchase Receipts';
            }
            field("Receiving No. B2B"; Rec."Receiving No.")
            {
                ApplicationArea = All;
                ToolTip = 'Receiving Numbers Format is Setup in Receiving Number Series. These Numbers are Unique. Assigned against the Receiving document in Purchase orders. ';
            }
            field("Posting No. Series B2B"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
                ToolTip = 'Posting Number Series are Defined in Number Series Setup and Assigned in Purchase & Payable Setup. This Number Series Used against the Posted Documents';

            }
        }
    }
    actions
    {
        modify(Release)
        {
            Visible = false;
        }
        addlast(navigation)
        {
            action("ReleaseNewOrdB2B")
            {
                ApplicationArea = Advanced;
                ToolTip = 'It Represents the Release New Order';
                Caption = 'Release';
                Image = ReleaseDoc;
                trigger OnAction();
                var
                    ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    ReleasePurchDoc.PerformManualRelease(Rec);
                    // Start  B2BPLM1.00.00
                    WorkSheetRec2.RESET();
                    WorkSheetRec2.SETRANGE(External, true);
                    WorkSheetRec2.SETRANGE("Line Type", ServiceTextLbl);
                    WorkSheetRec2.SETRANGE("Purchase Order No.", Rec."No.");
                    if WorkSheetRec2.FINDFIRST() then
                        repeat
                            PurchLineRec.SETRANGE("Document No.", Rec."No.");
                            PurchLineRec.SETRANGE("Machine Id B2B", WorkSheetRec2."Machine ID");
                            PurchLineRec.SETRANGE("Job Card No. B2B", WorkSheetRec2."Job Card No.");
                            if PurchLineRec.FINDFIRST() then begin
                                WorkSheetRec2.Quantity := PurchLineRec.Quantity;
                                WorkSheetRec2."Unit Cost" := PurchLineRec."Unit Cost";
                                WorkSheetRec2.Amount := PurchLineRec.Amount;
                                WorkSheetRec2.MODIFY();
                            end;
                        until WorkSheetRec2.NEXT() = 0;

                    // Stop   B2BPLM1.00.00
                end;
            }
        }
        modify(Post)
        {
            Visible = false;
        }
        addafter(ReleaseNewOrdB2B)
        {
            action("PostNewB2B")
            {
                ApplicationArea = Advanced;
                ToolTip = 'It Represents The Posting Of New Document.';
                Caption = 'PostNew';
                Image = Post;
                trigger OnAction();
                begin
                    // Start  B2BPLM1.00.00
                    Rec.TESTFIELD(Status, Rec.Status::Released.AsInteger());
                    // Stop   B2BPLM1.00.00
                    //Post(CODEUNIT::"Purch.-Post (Yes/No)");
                end;
            }
        }
    }

    var

        WorkSheetRec2: Record "Work Sheet B2B";
        PurchLineRec: Record "Purchase Line";
        ServiceTextLbl: Label 'SERVICE';
}

