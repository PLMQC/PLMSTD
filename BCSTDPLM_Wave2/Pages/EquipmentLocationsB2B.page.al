page 33000936 "Equipment Locations B2B"
{

    Caption = 'Equipment Locations';
    PageType = List;
    SourceTable = "Equipment Location B2B";
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
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Location Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Location Description.';
                }
            }
        }
    }

    actions
    {
    }
}

