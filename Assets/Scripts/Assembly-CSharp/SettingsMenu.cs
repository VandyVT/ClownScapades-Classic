using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x02000020 RID: 32
public class SettingsMenu : MonoBehaviour
{
	// Token: 0x06000083 RID: 131 RVA: 0x000037DC File Offset: 0x000019DC
	private void Start()
	{
		this.resolutions = Screen.resolutions;
		this.resolutionDropdown.ClearOptions();
		List<string> list = new List<string>();
		int value = 0;
		for (int i = 0; i < this.resolutions.Length; i++)
		{
			string item = this.resolutions[i].width + " x " + this.resolutions[i].height;
			list.Add(item);
			if (this.resolutions[i].width == Screen.width && this.resolutions[i].height == Screen.height)
			{
				value = i;
			}
		}
		this.resolutionDropdown.AddOptions(list);
		this.resolutionDropdown.value = value;
		this.resolutionDropdown.RefreshShownValue();
	}

	// Token: 0x06000084 RID: 132 RVA: 0x000038B0 File Offset: 0x00001AB0
	public void SetResolution(int resolutionIndex)
	{
		Resolution resolution = this.resolutions[resolutionIndex];
		Screen.SetResolution(resolution.width, resolution.height, Screen.fullScreen);
	}

	// Token: 0x06000085 RID: 133 RVA: 0x000038E2 File Offset: 0x00001AE2
	public void SetFullscreen(bool isFullscreen)
	{
		Screen.fullScreen = isFullscreen;
	}

	// Token: 0x04000075 RID: 117
	private Resolution[] resolutions;

	// Token: 0x04000076 RID: 118
	public Dropdown resolutionDropdown;
}
