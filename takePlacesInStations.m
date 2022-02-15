function places = takePlacesInStations(places, path)
    for i=1:length(path)
        el = path(i);
        places(el, i) = places(el, i) - 1;
    end
end