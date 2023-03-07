page 33000953 "Complaint Line Types B2B"
{

    Caption = 'Complaint Line Types';
    PageType = List;
    SourceTable = "Complaint Line Type B2B";
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
            }
        }
    }

    actions
    {
    }
}

