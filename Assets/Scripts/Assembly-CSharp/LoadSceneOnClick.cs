using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000030 RID: 48
public class LoadSceneOnClick : MonoBehaviour
{
	// Token: 0x060000D2 RID: 210 RVA: 0x00004678 File Offset: 0x00002878
	public void LoadByIndex(int sceneIndex)
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}
}
