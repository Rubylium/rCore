---@type table
local SettingsButtonWithStyle = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}

---ButtonWithStyle
---@param Label string
---@param Description string
---@param Enabled boolean
---@param Callback function
---@param Submenu table
---@return nil
---@public
function RageUI.ButtonWithStyle(Label, Description, Style, Enabled, Callback, Submenu)
    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() then

            ---@type number
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then

                ---@type boolean
                local Selected = CurrentMenu.Index == Option

                RageUI.ItemsSafeZone(CurrentMenu)

                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)

                local Hovered = false;
                if Style.Color ~= nil then
                    if Style.Color.BackgroundColor ~= nil then
                        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height, Style.Color.BackgroundColor[1],Style.Color.BackgroundColor[2],Style.Color.BackgroundColor[3])
                    end
                end

                ---@type boolean
                if CurrentMenu.EnableMouse == true then
                    Hovered = RageUI.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButtonWithStyle);
                end

                if Selected then
                    if Style.Color == nil then
                        RenderSprite(SettingsButtonWithStyle.SelectedSprite.Dictionary, SettingsButtonWithStyle.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height)
                    end

                    if Style.Color ~= nil and Style.Color.HightLightColor  ~= nil then
                        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height, Style.Color.HightLightColor[1],Style.Color.HightLightColor[2],Style.Color.HightLightColor[3])
                    else
                        RenderSprite(SettingsButtonWithStyle.SelectedSprite.Dictionary, SettingsButtonWithStyle.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height)
                    end
                end

                if type(Style) == 'table' then
                    if Style.LeftBadge ~= nil then
                        if Style.LeftBadge ~= RageUI.BadgeStyle.None and Style.LeftBadge ~= nil then
                            local LeftBadge = Style.LeftBadge(Selected)
                            RenderSprite(LeftBadge.BadgeDictionary or "commonmenu", LeftBadge.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.LeftBadge.Width, SettingsButtonWithStyle.LeftBadge.Height, 0, LeftBadge.BadgeColour and LeftBadge.BadgeColour.R or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.G or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.B or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.A or 255)
                        end
                    end

                    if Style.RightBadge ~= nil then
                        if Style.RightBadge ~= RageUI.BadgeStyle.None then
                            local RightBadge = Style.RightBadge(Selected)
                            RenderSprite(RightBadge.BadgeDictionary or "commonmenu", RightBadge.BadgeTexture or "", CurrentMenu.X + SettingsButtonWithStyle.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButtonWithStyle.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.RightBadge.Width, SettingsButtonWithStyle.RightBadge.Height, 0, RightBadge.BadgeColour and RightBadge.BadgeColour.R or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.G or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.B or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.A or 255)
                        end
                    end
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButtonWithStyle.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButtonWithStyle.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.RightText.Scale, 0, 0, 0, 255, 2)
                        end
                        RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 0, 0, 0, 255)
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButtonWithStyle.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButtonWithStyle.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.RightText.Scale, 245, 245, 245, 255, 2)
                        end

                        RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 163, 159, 148, 255)
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButtonWithStyle.Rectangle.Height

                RageUI.ItemsDescription(CurrentMenu, Description, Selected);

                if (Enabled) then
                    Callback(Hovered, Selected, ((CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and Selected))
                end

                if Selected and (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) then
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                    if Submenu ~= nil then
                        if Submenu() then
                            RageUI.NextMenu = Submenu
                        end
                    end
                end
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end



function RageUI.CenterButtonWithStyle(Label, Description, Style, Enabled, Callback, Submenu)

    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() then

            ---@type number
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then

                ---@type boolean
                local Selected = CurrentMenu.Index == Option

                RageUI.ItemsSafeZone(CurrentMenu)

                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)

                local Hovered = false;
                if Style.Color ~= nil then
                    if Style.Color.BackgroundColor ~= nil then
                        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height, Style.Color.BackgroundColor[1],Style.Color.BackgroundColor[2],Style.Color.BackgroundColor[3])
                    end
                end
                ---@type boolean
                if CurrentMenu.EnableMouse == true then
                    Hovered = RageUI.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButtonWithStyle);
                end
                if Selected then
                    if Style.Color == nil then
                        RenderSprite(SettingsButtonWithStyle.SelectedSprite.Dictionary, SettingsButtonWithStyle.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height)
                    end

                    if Style.Color ~= nil and Style.Color.HightLightColor  ~= nil then
                        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height, Style.Color.HightLightColor[1],Style.Color.HightLightColor[2],Style.Color.HightLightColor[3])
                    else
                        RenderSprite(SettingsButtonWithStyle.SelectedSprite.Dictionary, SettingsButtonWithStyle.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButtonWithStyle.SelectedSprite.Height)
                    end
                end

                if type(Style) == 'table' then
                    if Style.LeftBadge ~= nil then
                        if Style.LeftBadge ~= RageUI.BadgeStyle.None and Style.LeftBadge ~= nil then
                            local LeftBadge = Style.LeftBadge(Selected)
                            RenderSprite(LeftBadge.BadgeDictionary or "commonmenu", LeftBadge.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButtonWithStyle.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.LeftBadge.Width, SettingsButtonWithStyle.LeftBadge.Height, 0, LeftBadge.BadgeColour and LeftBadge.BadgeColour.R or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.G or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.B or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.A or 255)
                        end
                    end

                    if Style.RightBadge ~= nil then
                        if Style.RightBadge ~= RageUI.BadgeStyle.None and Style.RightBadge ~= nil then
                            local RightBadge = Style.RightBadge(Selected)
                            RenderSprite(RightBadge.BadgeDictionary or "commonmenu", RightBadge.BadgeTexture or "", CurrentMenu.X + SettingsButtonWithStyle.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButtonWithStyle.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButtonWithStyle.RightBadge.Width, SettingsButtonWithStyle.RightBadge.Height, 0, RightBadge.BadgeColour and RightBadge.BadgeColour.R or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.G or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.B or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.A or 255)
                        end
                    end
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButtonWithStyle.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButtonWithStyle.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.RightText.Scale, 0, 0, 0, 255, 2)
                        end
                        RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + LeftBadgeOffset+250.0, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 0, 0, 0, 255,1)
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButtonWithStyle.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButtonWithStyle.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.RightText.Scale, 245, 245, 245, 255, 2)
                        end

                        RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + LeftBadgeOffset+250.0, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 245, 245, 245, 255,1)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 163, 159, 148, 255)
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButtonWithStyle.Rectangle.Height

                RageUI.ItemsDescription(CurrentMenu, Description, Selected);

                if (Enabled) then
                    Callback(Hovered, Selected, ((CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and Selected))
                end

                if Selected and (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) then
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                    if Submenu ~= nil then
                        if Submenu() then
                            RageUI.NextMenu = Submenu
                        end
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1

        end
    end
end

function RageUI.Separator(Label)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    RenderText(Label, CurrentMenu.X + SettingsButtonWithStyle.Text.X + 250.0, CurrentMenu.Y + SettingsButtonWithStyle.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButtonWithStyle.Text.Scale, 245, 245, 245, 255,1)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButtonWithStyle.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
