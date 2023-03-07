page 33000905 "Equipment Movements B2B"
{

    Caption = 'Equipment Movements';
    PageType = ListPart;
    SourceTable = "Movement B2B";

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Sl. No."; Rec."Sl. No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'This Field Defines unique No for Equipment';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Line Type.';
                    OptionCaption = '" ,In,Out"';
                }
                field("Ref. No."; Rec."Ref. No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Referece Number.';
                }
                field("Spare Item"; Rec."Spare Item")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Spare Item.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Quantity.';
                }
                field("Send To"; Rec."Send To")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor Name.';
                }
                field("Movement Date"; Rec."Movement Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Movement Date.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines External Maintenance.';
                }
                field("Gate Pass No."; Rec."Gate Pass No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Gate pass number related to vendor.';
                }
                field("Gate Pass Date"; Rec."Gate Pass Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Gate pass Date.';
                }
                field("Movement Type ID"; Rec."Movement Type ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Movement Type ID.';
                }
                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Movement Type based on ID.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
            }
        }
    }

    actions
    {
    }
}

