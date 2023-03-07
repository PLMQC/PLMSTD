page 33000966 "PM Engineer B2B"
{

    Caption = 'PM Engineer';
    PageType = RoleCenter;
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part("PM Engineer Activities"; "PM Engineer Activities B2B")
                {
                    Caption = 'PM Engineer Activities';
                    ApplicationArea = ALL;
                }
                systempart(Control1102152001; Outlook)
                {
                    ApplicationArea = ALL;
                }
            }
            group(Control1900724708)
            {
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("<Action9>")
            {
                Caption = 'Equipment';
                ApplicationArea = ALL;
                ToolTip = 'It Defines Equipment.';
                RunObject = Page "Equipment List B2B";
            }
            action("<Action12>")
            {
                Caption = 'Resource';
                ApplicationArea = ALL;
                ToolTip = 'It Defines Resource.';
                RunObject = Page "Resource List";
            }
            action("<Action13>")
            {
                Caption = 'Spares';
                ApplicationArea = ALL;
                ToolTip = 'It Defines spares.';
                RunObject = Page "Spares Master B2B";
            }
            action("<Action14>")
            {
                Caption = 'Run Time Frequency';
                ApplicationArea = ALL;
                ToolTip = 'It Defines Run time Frequency.';
                RunObject = Page "Run Time Frequency List B2B";
            }
            action("<Action15>")
            {
                Caption = 'Equipment Locations';
                ApplicationArea = ALL;
                ToolTip = 'It Defines Equipment location.';
                RunObject = Page "Equipment Locations B2B";
            }
            action("<Action16>")
            {
                Caption = 'Equipment Groups';
                ApplicationArea = ALL;
                ToolTip = 'It Defines Equipment group.';
                RunObject = Page "Equipment Groups B2B";
            }
            action("<Action17>")
            {
                Caption = 'Specification Groups';
                ApplicationArea = ALL;
                ToolTip = 'It Defines specifications group.';
                RunObject = Page "Specification Groups B2B";
            }
        }
    }
}

