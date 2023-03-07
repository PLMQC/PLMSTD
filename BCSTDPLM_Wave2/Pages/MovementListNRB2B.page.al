page 33000906 "Movement List NR B2B"
{

    Caption = 'Movement List NR';
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = "Movement B2B";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Type of line Like Variable or Fixed';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Type of Movement';
                }
                field(ID; Rec.ID)
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Machine Id';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Name of Vendor ';
                }
                field("Spare Item"; Rec."Spare Item")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Spare Items';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Quantity ';
                }
                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Movement Type.';
                }
            }
        }
    }

    actions
    {
    }
}

