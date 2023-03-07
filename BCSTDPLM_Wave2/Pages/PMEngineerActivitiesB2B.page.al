page 33000986 "PM Engineer Activities B2B"
{
    Caption = 'PM Engineer Activities';
    PageType = CardPart;
    SourceTable = "PLM Cue B2B";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            cuegroup("Equipment Status")
            {
                Caption = 'Equipment Status';
                field(Equipments; Rec."Total Equipments")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment Status.';
                    Caption = 'Equipments';
                    DrillDownPageID = "Equipment List B2B";
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Resource.';
                    DrillDownPageID = "Resource List";
                }
                field(Spares; Rec.Spares)
                {
                    DrillDownPageID = "Spares Master B2B";
                    ApplicationArea = all;
                    ToolTip = 'It Defines Spares.';
                }
                field("In Use Equipments"; Rec."In Use Equipments")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines In Use Equipment.';
                }
                field("Un Used Equipments"; Rec."Un Used Equipments")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Un Used Equipment.';
                }

            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.RESET();
        if not Rec.GET() then begin
            Rec.INIT();
            Rec.INSERT();
        end;
        Rec.SETRANGE("Date Filter", 0D, WORKDATE() - 1);
        Rec.SETFILTER("Date Filter2", '>=%1', WORKDATE());
    end;
}

