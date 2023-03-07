page 33000949 "Calibration PLM B2B"
{

    Caption = 'Calibration';
    PageType = List;
    SourceTable = "Calibration PLM B2B";
    UsageCategory = Administration;
    ApplicationArea = all;
    ObsoleteState = Pending;
    ObsoleteReason = 'Functionallity Removed';
    ObsoleteTag = '21.0';
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

