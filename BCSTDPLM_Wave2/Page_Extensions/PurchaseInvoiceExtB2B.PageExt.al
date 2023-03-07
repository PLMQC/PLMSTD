pageextension 33000893 "Purchase Invoice Ext B2B" extends "Purchase Invoice"
{

    actions
    {
        modify(Release)
        {
            Visible = false;
        }
        addlast(navigation)
        {
            action("ReleaseNewInvB2B")
            {
                ApplicationArea = Advanced;
                ToolTip = 'This Field Represents Releasing of the New invoice Document';
                Caption = 'Release';
                Image = ReleaseDoc;
                trigger OnAction();
                var
                    ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    ReleasePurchDoc.PerformManualRelease(Rec);
                    // Start  B2BPLM1.00.00
                    WorkSheetRec2.SETRANGE("Job Card No.", Rec."Job Card No. B2B");
                    WorkSheetRec2.SETRANGE(External, TRUE);
                    WorkSheetRec2.SETRANGE("Line Type", ExtSourceTextLbl);
                    WorkSheetRec2.SETRANGE("Purchase Order No.", Rec."No.");
                    IF WorkSheetRec2.FINDFIRST() THEN BEGIN
                        PurchLineRec.SETRANGE("Document No.", Rec."No.");
                        IF PurchLineRec.FINDFIRST() THEN BEGIN
                            WorkSheetRec2.Quantity := PurchLineRec.Quantity;
                            WorkSheetRec2."Unit Cost" := PurchLineRec."Unit Cost";
                            WorkSheetRec2.Amount := PurchLineRec.Amount;
                            WorkSheetRec2.MODIFY();
                        END;
                    END;
                    // Stop   B2BPLM1.00.00
                end;
            }
        }
    }
    var
        WorkSheetRec2: Record "Work Sheet B2B";
        PurchLineRec: Record "Purchase Line";
        ExtSourceTextLbl: Label 'EXT. SOURCE';
}

