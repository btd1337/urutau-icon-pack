/*-
 * Copyright (c) 2018 Shubham Arora (https://github.com/arshubham/urutau-icon-pack)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Shubham Arora <shubhamarora@protonmail.com>
 */

using IconPack.Configs;
using IconPack.Controllers;
using IconPack.Views;

namespace IconPack {

    public class Window : Gtk.ApplicationWindow {

        public Window (Gtk.Application app) {

            Object (
                application: app,
                icon_name: Constants.APP_ICON
            );

            // var settings = PapirusIconPack.Configs.Settings.get_instance ();
            // int x = settings.window_x;
            // int y = settings.window_y;

            // if (x != -1 && y != -1) {
            //     move (x, y);
            // }

            // style_provider ();
            build (app);
        }

         private void style_provider () {

             var css_provider = new Gtk.CssProvider ();
             css_provider.load_from_resource (Constants.URL_CSS);

             Gtk.StyleContext.add_provider_for_screen (
                 Gdk.Screen.get_default (),
                 css_provider,
                 Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
             );
         }

        private void build (Gtk.Application app) {
            var app_view = new AppView (this);
            new AppController (this, app, app_view);
            get_style_context ().add_class ("rounded");
            add (app_view);
            show_all ();
        }


    }
}
